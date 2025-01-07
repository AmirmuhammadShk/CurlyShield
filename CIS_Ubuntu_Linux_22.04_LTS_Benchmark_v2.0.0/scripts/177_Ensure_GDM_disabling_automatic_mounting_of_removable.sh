echo "[org/gnome/desktop/media-handling]" > /etc/dconf/db/local.d/locks/00-media-automount
echo "automount=false" >> /etc/dconf/db/local.d/locks/00-media-automount
echo "automount-open=false" >> /etc/dconf/db/local.d/locks/00-media-automount
dconf update