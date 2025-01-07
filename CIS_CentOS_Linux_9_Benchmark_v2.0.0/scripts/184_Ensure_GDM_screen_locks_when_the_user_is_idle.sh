dconf update
echo 'user-db:user' >> /etc/dconf/profile/
echo 'system-db:local' >> /etc/dconf/profile/user
mkdir -p /etc/dconf/db/local.d/
echo '[org/gnome/desktop/session]' > /etc/dconf/db/local.d/00-screensaver
echo "idle-delay=uint32 900" >> /etc/dconf/db/local.d/00-screensaver
echo '[org/gnome/desktop/screensaver]' >> /etc/dconf/db/local.d/00-screensaver
echo "lock-delay=uint32 5" >> /etc/dconf/db/local.d/00-screensaver