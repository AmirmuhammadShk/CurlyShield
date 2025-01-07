server <remote-server> 2>/dev/null || echo "Error adding server to chrony.conf"
update-chrony 2>/dev/null || echo "Error updating chrony configuration"
systemctl start chronyd &> /dev/null  # Run as systemd service (adjust for other distros)
systemctl enable chronyd &> /dev/null  # Enable at boot
systemctl restart chronyd  # Restart to apply changes
if [ $? -eq 0 ]; then
echo "Chrony is configured"
else
echo "Error configuring chrony"
fi