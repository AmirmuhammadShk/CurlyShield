if systemctl unmask chrony.service; then
systemctl --now enable chrony.service
else
apt purge chrony
fi