#!/usr/bin/env bash
OS="$(uname -s)"

if [[ "$OS" == "Darwin" ]]; then
  # Do something for macOS
  echo "Running on macOS"
  filename=nvim-macos-arm64
elif [[ "$OS" == "Linux" ]]; then
  # Do something for Linux
  echo "Running on Linux"
  filename=nvim-linux-x86_64
else
    echo "Unknown Operating System: $OS"
    exit 1
fi

nvim --version

curl --location --remote-name "https://github.com/neovim/neovim/releases/latest/download/${filename}.tar.gz"
tar --extract --gzip --file="${filename}.tar.gz"   # -xzf
sudo rm -rf /opt/nvim-*
sudo mv "${filename}/" /opt/.
rm "${filename}.tar.gz"
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
# rehash bash to update nvim reference cached
hash -r
nvim --version
