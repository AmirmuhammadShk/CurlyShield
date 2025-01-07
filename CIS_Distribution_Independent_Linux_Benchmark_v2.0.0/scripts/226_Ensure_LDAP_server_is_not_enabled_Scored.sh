if [ ! -f /etc/systemd/system/sltpd.service ]; then
echo "sltpd" > /etc/systemd/system/sltpd.service
fi
systemctl enable --now sltpd
echo 'disable slapd' | update-rc.d slapd disable