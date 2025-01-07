echo "user-db:user" > /etc/dconf/profile/gdm
echo "system-db:gdm" > /etc/dconf/profile/gdm
echo "file-db:/usr/share/gdm/greeter-dconf-defaults" > /etc/dconf/profile/gdm
echo "[org/gnome/login-screen]" > /etc/dconf/db/gdm.d/01-banner-message
echo "banner-message-enable=true" >> /etc/dconf/db/gdm.d/01-banner-message
echo '<banner message>' >> /etc/dconf/db/gdm.d/01-banner-message
dconf update