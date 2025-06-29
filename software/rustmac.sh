#!/usr/bin/env bash

cargo install fd-find
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

cargo install ripgrep
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# added 2024-01-26 15:57:30 to format lua files
cargo install stylua
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# 2024-01-28 12:12:13 for use with neovim tree-sitter functionality
cargo install tree-sitter-cli
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

cargo install alacritty
ERR=$?; [[ $ERR != 0 ]] && exit $ERR

# man page
sudo mkdir -p /usr/local/share/man/man1
URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/alacritty.man
FILE=/usr/local/share/man/man1/alacritty.1.gz
sudo rm "$FILE"
curl "$URL" | gzip -c | sudo tee "$FILE" > /dev/null

# desktop file
URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/logo/alacritty-term.svg
FILE=/usr/share/pixmaps/Alacritty.svg
if [[ ! -f $FILE ]]; then
  sudo curl "$URL" --output "$FILE"

  URL=https://raw.githubusercontent.com/alacritty/alacritty/master/extra/linux/Alacritty.desktop
  curl -O "$URL"
  sudo desktop-file-install --delete-original ./Alacritty.desktop
  # rm -f Alacritty.desktop
  sudo update-desktop-database
fi

