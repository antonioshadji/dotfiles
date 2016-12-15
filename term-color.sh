# inspired by https://github.com/Anthony25/gnome-terminal-colors-solarized
# cron script to switch terminal colors in the evening
export DISPLAY=:0

# http://stackoverflow.com/questions/10374520/gsettings-with-cron
PID=$(pgrep gnome-terminal)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

profile_id="$(dconf read /org/gnome/terminal/legacy/profiles:/default|sed s/\'//g)"

# http://ethanschoonover.com/solarized
# light
base3='#fdfdf6f6e3e3'  # background
base00='#65657b7b8383' # body text/default code/primary content
base01='#58586e6e7575' # optional emphasized content
# dark
base03='#00002b2b3636' # background
base0='#838394949696'  # body text/default code/primary content
base1='#9393a1a1a1a1'  # optional emphasized content

# http://www.tldp.org/LDP/abs/html/comparison-ops.html
if [ "$1" = "light" ]; then
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'$base3'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/foreground-color "'$base00'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/bold-color "'$base01'"
elif [ "$1" = "dark" ]; then
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/background-color "'$base03'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/foreground-color "'$base0'"
  dconf write /org/gnome/terminal/legacy/profiles:/:$profile_id/bold-color "'$base1'"
else
  echo "Requires parameter of light or dark"
fi
