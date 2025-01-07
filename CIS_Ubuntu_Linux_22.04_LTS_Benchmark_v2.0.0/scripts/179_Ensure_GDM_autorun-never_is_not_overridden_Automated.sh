echo "[org/gnome/desktop/media-handling]" > /etc/dconf/db/local.d/locks/00-media-autorun
echo "autorun-never=true" >> /etc/dconf/db/local.d/locks/00-media-autorun
dconf update