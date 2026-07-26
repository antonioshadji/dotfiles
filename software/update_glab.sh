#!/usr/bin/env bash
set -euo pipefail

# Script to update GitLab CLI (glab) to the latest release

INSTALL_DIR="/usr/local/bin"
USE_DEB=true

# Process command line arguments
for arg in "$@"; do
  case $arg in
    --user)
      INSTALL_DIR="$HOME/.local/bin"
      USE_DEB=false
      shift
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
LATEST_TAG=$(curl -s "https://gitlab.com/api/v4/projects/gitlab-org%2Fcli/releases?per_page=1" | jq -r '.[0].tag_name')

if [[ -z "$LATEST_TAG" || "$LATEST_TAG" == "null" ]]; then
    echo "Error: Failed to fetch latest release tag from GitLab API." >&2
    exit 1
fi

VERSION="${LATEST_TAG#v}"
echo "==> Latest version available: ${VERSION} (${LATEST_TAG})"

OS="$(uname -s)"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

if [[ "$OS" == "Linux" ]]; then
    if [[ "$USE_DEB" == true ]] && command -v dpkg &>/dev/null; then
        ARCH=$(dpkg --print-architecture)
        DEB_NAME="glab_${VERSION}_linux_${ARCH}.deb"
        DOWNLOAD_URL="https://gitlab.com/gitlab-org/cli/-/releases/${LATEST_TAG}/downloads/${DEB_NAME}"

        echo "==> Downloading ${DEB_NAME}..."
        curl -L --fail --progress-bar -o "${TMP_DIR}/${DEB_NAME}" "${DOWNLOAD_URL}"

        echo "==> Installing ${DEB_NAME} via dpkg (requires sudo)..."
        sudo dpkg -i "${TMP_DIR}/${DEB_NAME}"
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
        if [[ -w "$INSTALL_DIR" ]]; then
            mv "${TMP_DIR}/bin/glab" "${INSTALL_DIR}/glab"
        else
            sudo mv "${TMP_DIR}/bin/glab" "${INSTALL_DIR}/glab"
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
    if [[ -w "$INSTALL_DIR" ]]; then
        mv "${TMP_DIR}/bin/glab" "${INSTALL_DIR}/glab"
    else
        sudo mv "${TMP_DIR}/bin/glab" "${INSTALL_DIR}/glab"
    fi
else
    echo "Unsupported operating system: $OS" >&2
    exit 1
fi

hash -r 2>/dev/null || true

echo "==> Update complete! Installed version:"
glab --version
