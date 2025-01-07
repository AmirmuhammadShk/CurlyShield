sed -i '/enabled/d' /etc/default/apport
echo "enabled=0" >> /etc/default/apport
systemctl stop apport.service || true
systemctl --now disable apport.service || true
apt purge apport || true