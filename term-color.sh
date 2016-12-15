export DISPLAY=:0

# http://stackoverflow.com/questions/10374520/gsettings-with-cron
PID=$(pgrep gnome-terminal)
export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2-)

# http://www.tldp.org/LDP/abs/html/comparison-ops.html
if [ "$1" = "light" ]; then
  dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color "'#fdfdf6f6e3e3'"
  dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/foreground-color "'#65657b7b8383'"
else
  dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/background-color "'#00002B2B3636'"
  dconf write /org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9/foreground-color "'#838394949696'"
fi
