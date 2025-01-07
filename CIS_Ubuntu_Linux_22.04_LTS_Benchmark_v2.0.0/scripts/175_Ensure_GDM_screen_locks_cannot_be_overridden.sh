echo "org/gnome/desktop/session/idle-delay" > /etc/dconf/db/local.d/locks/screensaver
echo "org/gnome/desktop/screensaver/lock-delay" >> /etc/dconf/db/local.d/locks/screensaver
dconf update