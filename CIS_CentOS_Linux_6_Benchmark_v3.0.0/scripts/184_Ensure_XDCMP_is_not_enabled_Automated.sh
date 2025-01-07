sed -i '/^Enabled=/d' /etc/gdm/custom.conf
systemctl restart gdm