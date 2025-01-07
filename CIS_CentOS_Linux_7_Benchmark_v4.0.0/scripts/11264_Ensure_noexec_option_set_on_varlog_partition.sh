if [ -n "$(df | grep "/var/log" | awk '{print $5}' | tr '[:upper:]' '[:lower:]')" ]; then
# Get the current fstab file
fstab=$(cat /etc/fstab)
# Check if the fourth field in the fstab entry for /var/log is empty
if [ -n "$(echo "$fstab" | grep "/var/log" | awk '{print $4}' | tr '[:upper:]' '[:lower:]')" ]; then
# Get the current mounting options
mount_options=$(echo "$fstab" | grep "/var/log" | awk '{print $4}' | tr '[:upper:]' '[:lower:]')
# Add noexec option to the mounting options
if ! echo "$mount_options" | grep -q "noexec"; then
fstab=$(sed -e "/\/var\/log/{s/.*//; s/$/,nosuid,nodev,noexec,relatime /}" <<< "$fstab")
fi
# Edit the fstab file with noexec option
echo "$fstab" > /etc/fstab
# Run the remount command to apply the changes
mount -o remount /var/log
else
# Create a new partition for /var/log if it doesn't exist as a separate partition
mkdir /mnt/var/log
mount /dev/sda6 /mnt/var/log
fi
mount -o remount /var/log