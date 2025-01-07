echo "user-db:user" > /etc/dconf/profile/gdm
echo "[org/gnome/login-screen]" >> /etc/dconf/db/gdm.d/
echo "disable-user-list=true" >> /etc/dconf/db/gdm.d/
dconf update