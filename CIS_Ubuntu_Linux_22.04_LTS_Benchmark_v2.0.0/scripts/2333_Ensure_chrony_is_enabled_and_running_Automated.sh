if systemctl status chrony.service | grep -q "active"; then
echo "chrony is already in use, skipping"
else
# Unmask chrony service
systemctl unmask chrony.service
# Enable and start chrony service
systemctl --now enable chrony.service
fi
if [ "$(apt policy chrony)" ]; then
echo "chrony already removed, skipping"
else
# Purge chrony
apt purge chrony
# Autoremove chrony
apt autoremove chrony
fi