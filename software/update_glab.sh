#!/usr/bin/env bash
set -euo pipefail

# Script to update GitLab CLI (glab) to the latest release

INSTALL_DIR="/usr/local/bin"
USE_DEB=true

# Process command line arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --user)
      INSTALL_DIR="$HOME/.local/bin"
      USE_DEB=false
      shift
      ;;
    -h|--help)
      echo "Usage: $0 [--user]"
      echo "  --user   Install binary to ~/.local/bin instead of system-wide"
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      exit 1
      ;;
  esac
done

echo "==> Checking current glab version..."
if command -v glab &>/dev/null; then
    glab --version | head -n 1
else
    echo "glab is not currently installed."
fi

echo "==> Fetching latest GitLab CLI release information..."
LATEST_TAG=$(curl -fsSL "https://gitlab.com/api/v4/projects/gitlab-org%2Fcli/releases?per_page=1" | jq -r '.[0].tag_name')

if [[ -z "$LATEST_TAG" || "$LATEST_TAG" == "null" ]]; then
    echo "Error: Failed to fetch latest release tag from GitLab API." >&2
    exit 1
fi

VERSION="${LATEST_TAG#v}"
echo "==> Latest version available: ${VERSION} (${LATEST_TAG})"

OS="$(uname -s)"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

TARGET_BIN=""

if [[ "$OS" == "Linux" ]]; then
    if [[ "$USE_DEB" == true ]] && command -v dpkg &>/dev/null; then
        ARCH=$(dpkg --print-architecture)
        DEB_NAME="glab_${VERSION}_linux_${ARCH}.deb"
        DOWNLOAD_URL="https://gitlab.com/gitlab-org/cli/-/releases/${LATEST_TAG}/downloads/${DEB_NAME}"

        echo "==> Downloading ${DEB_NAME}..."
        curl -L --fail --progress-bar -o "${TMP_DIR}/${DEB_NAME}" "${DOWNLOAD_URL}"

        echo "==> Installing ${DEB_NAME} via dpkg (requires sudo)..."
        sudo dpkg -i "${TMP_DIR}/${DEB_NAME}"
        TARGET_BIN="/usr/bin/glab"
    else
        ARCH=$(uname -m)
        case "$ARCH" in
            x86_64) ARCH_STR="amd64" ;;
            aarch64|arm64) ARCH_STR="arm64" ;;
            *) ARCH_STR="$ARCH" ;;
        esac
        TAR_NAME="glab_${VERSION}_linux_${ARCH_STR}.tar.gz"
        DOWNLOAD_URL="https://gitlab.com/gitlab-org/cli/-/releases/${LATEST_TAG}/downloads/${TAR_NAME}"

        echo "==> Downloading ${TAR_NAME}..."
        curl -L --fail --progress-bar -o "${TMP_DIR}/${TAR_NAME}" "${DOWNLOAD_URL}"

        echo "==> Extracting glab binary..."
        tar -xzf "${TMP_DIR}/${TAR_NAME}" -C "$TMP_DIR"

        mkdir -p "$INSTALL_DIR"
        TARGET_BIN="${INSTALL_DIR}/glab"
        if [[ -w "$INSTALL_DIR" ]]; then
            mv "${TMP_DIR}/bin/glab" "$TARGET_BIN"
        else
            sudo mv "${TMP_DIR}/bin/glab" "$TARGET_BIN"
        fi
    fi
elif [[ "$OS" == "Darwin" ]]; then
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64) ARCH_STR="amd64" ;;
        arm64) ARCH_STR="arm64" ;;
        *) ARCH_STR="$ARCH" ;;
    esac
    TAR_NAME="glab_${VERSION}_darwin_${ARCH_STR}.tar.gz"
    DOWNLOAD_URL="https://gitlab.com/gitlab-org/cli/-/releases/${LATEST_TAG}/downloads/${TAR_NAME}"

    echo "==> Downloading ${TAR_NAME}..."
    curl -L --fail --progress-bar -o "${TMP_DIR}/${TAR_NAME}" "${DOWNLOAD_URL}"

    echo "==> Extracting glab binary..."
    tar -xzf "${TMP_DIR}/${TAR_NAME}" -C "$TMP_DIR"

    mkdir -p "$INSTALL_DIR"
    TARGET_BIN="${INSTALL_DIR}/glab"
    if [[ -w "$INSTALL_DIR" ]]; then
        mv "${TMP_DIR}/bin/glab" "$TARGET_BIN"
    else
        sudo mv "${TMP_DIR}/bin/glab" "$TARGET_BIN"
    fi
else
    echo "Unsupported operating system: $OS" >&2
    exit 1
fi

# Clean up any outdated or duplicate binaries in other locations
cleanup_outdated_binaries() {
    local active_bin="$1"
    local active_real
    active_real="$(realpath "$active_bin" 2>/dev/null || echo "$active_bin")"

    local candidate_paths=()
    if [[ "$USE_DEB" == true || "$INSTALL_DIR" != "$HOME/.local/bin" ]]; then
        candidate_paths+=(
            "$HOME/.local/bin/glab"
            "/usr/local/bin/glab"
        )
    fi

    while IFS= read -r p; do
        [[ -n "$p" ]] && candidate_paths+=("$p")
    done < <(which -a glab 2>/dev/null || true)

    local seen=()
    for bin_path in "${candidate_paths[@]}"; do
        [[ -e "$bin_path" || -L "$bin_path" ]] || continue
        local real_p
        real_p="$(realpath "$bin_path" 2>/dev/null || echo "$bin_path")"

        # Check if already processed
        local already_seen=false
        for s in "${seen[@]:-}"; do
            if [[ "$s" == "$real_p" ]]; then
                already_seen=true
                break
            fi
        done
        [[ "$already_seen" == true ]] && continue
        seen+=("$real_p")

        if [[ "$real_p" != "$active_real" ]]; then
            # Do not delete system /usr/bin/glab when installing in user mode
            if [[ "$USE_DEB" == false && "$INSTALL_DIR" == "$HOME/.local/bin" && "$real_p" == "/usr/bin/glab" ]]; then
                continue
            fi

            local old_ver
            old_ver="$("$bin_path" --version 2>/dev/null | head -n 1 || echo "unknown")"
            echo "==> Notice: Found and removed outdated/conflicting glab binary at: ${bin_path} (${old_ver})"
            if [[ -w "$bin_path" || -w "$(dirname "$bin_path")" ]]; then
                rm -f "$bin_path"
            else
                sudo rm -f "$bin_path"
            fi
        fi
    done
}

if [[ -n "$TARGET_BIN" ]]; then
    cleanup_outdated_binaries "$TARGET_BIN"
fi

hash -r 2>/dev/null || true

echo "==> Update complete! Installed version:"
glab --version
