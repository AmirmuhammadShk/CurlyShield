if [ -d "/var/tmp" ]; then
# Find the entry for /var/tmp in /etc/fstab
fstab_entry=$(grep "^/var/tmp" /etc/fstab)
# If entry is found, add nosuid option to mounting options
if [ -n "$fstab_entry" ]; then
new_options=${fstab_entry#* }
new_options+=" nosuid"
sed -i "s/$new_options/$new_options nosuid/" /etc/fstab
# Remount /var/tmp with configured options
mount -o remount /var/tmp
fi
else
# Create /etc/fstab entry for /var/tmp partition
echo "/var/tmp    tmpfs     defaults,rw,nosuid,nodev,noexec,relatime 0" >> /etc/fstab
fi