#!/usr/bin/env bash
#
# Shell script that configures gnome-terminal to use solarized theme
# colors. Written for Ubuntu 14.04, untested on anything else.
#
# Solarized theme: http://ethanschoonover.com/solarized
#
# Adapted from these sources:
# https://gist.github.com/1280177
# http://www.xorcode.com/2011/04/11/solarized-vim-eclipse-ubuntu/

# On my system,
# Solarized-Dark  is ~/.gconf/apps/gnome-terminal/profiles/Profile1
# Solarized-Light is ~/.gconf/apps/gnome-terminal/profiles/Profile2

if [ $(lsb_release -r | gawk '{ print $2 }') <= "14.04" ]; then
  # echo "Running on 14.04"
  if [[ $# -ne 2 ]]; then
    echo "Usage: solarize [light | dark] [Profile Folder]"
    exit
  else
    PROFILE="$2"
    case "$1" in
      "dark")
      PALETTE="#070736364242:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3"
      BG_COLOR="#00002B2B3636"
      FG_COLOR="#65657B7B8383"
        ;;
      "light")
      PALETTE="#EEEEE8E8D5D5:#D3D301010202:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#070736364242:#FDFDF6F6E3E3:#CBCB4B4B1616:#9393A1A1A1A1:#838394949696:#65657B7B8383:#6C6C7171C4C4:#58586E6E7575:#00002B2B3636"
      BG_COLOR="#FDFDF6F6E3E3"
      FG_COLOR="#838394949696"
        ;;
      *)
      ;;
    esac

    # gconftool symlinks to gconftool-2
    gconftool --set "/apps/gnome-terminal/profiles/$PROFILE/use_theme_background" --type bool false
    gconftool --set "/apps/gnome-terminal/profiles/$PROFILE/use_theme_colors" --type bool false
    gconftool --set "/apps/gnome-terminal/profiles/$PROFILE/palette" --type string "$PALETTE"
    gconftool --set "/apps/gnome-terminal/profiles/$PROFILE/background_color" --type string "$BG_COLOR"
    gconftool --set "/apps/gnome-terminal/profiles/$PROFILE/foreground_color" --type string "$FG_COLOR"

else
   echo "only run this code on Ubuntu 14.04 or earlier"
fi
