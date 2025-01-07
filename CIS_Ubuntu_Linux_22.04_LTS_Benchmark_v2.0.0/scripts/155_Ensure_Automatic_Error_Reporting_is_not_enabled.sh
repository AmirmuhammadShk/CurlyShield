sed -i '/enabled/s/.*$/enabled=0/' /etc/default/apport
systemctl stop apport.service || true
systemctl mask apport.service || true
apt purge apport || true