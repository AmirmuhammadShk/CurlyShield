if [ -d /tmp ]; then
# Get current fstab configuration for /tmp
fstab_tmp=$(cat /etc/fstab | grep "^/tmp" | head -n 1)
# If fstab file is found, parse options and add noexec option
if [ -n "$fstab_tmp" ]; then
options=$(echo "$fstab_tmp" | cut -d' ' -f6-)
new_options="$options,noexec"
sed -i "/^/tmp.*$/s/$/    $new_options/" /etc/fstab
else
# Create fstab entry for /tmp with noexec option
echo "/tmp /      tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" | tee -a /etc/fstab
fi
# Remount /tmp with configured options
mount -o remount /tmp
else
# If /tmp partition does not exist, create it and add noexec option to fstab
mkdir -p /tmp
echo "/tmp /      tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" | tee -a /etc/fstab
# Remount new /tmp partition with configured options
mount -o remount /tmp
fi