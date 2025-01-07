if [ ! -d /var ]; then
echo "Warning: /var partition does not exist. Skipping nosuid option setup."
else
# Update fstab file with nosuid option for /var partition
sed -i 's/defaults,rw,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime/' /etc/fstab
# Remount /var with configured options
mount -o remount /var
fi