if systemctl status systemd-timesyncd | grep -q "active (running)"; then
echo "Unmasking systemd-timesyncd service"
systemctl unmask systemd-timesyncd.service
echo "Enabling and starting systemd-timesyncd service"
systemctl --now enable systemd-timesyncd.service
else
echo "Masking systemd-timesyncd service"
systemctl --now mask systemd-timesyncd.service
fi