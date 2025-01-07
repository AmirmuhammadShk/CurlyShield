sed -i '/^Enabled=/d' /etc/gdm/custom.conf
echo "false" | sed -i 's/.*=//g' /etc/gdm/custom.conf