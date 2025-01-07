if [ -d "/var/tmp" ]; then
# Get current fstab entry for /var/tmp
fstab_entry=$(cat /etc/fstab | grep "/var/tmp")
# If fstab entry found, add noexec option to mounting options
if [ -n "$fstab_entry" ]; then
new_fstab_entry=${fstab_entry%% *}
new_fstab_entry=${new_fstab_entry:0:${#new_fstab_entry}-2}noexec${new_fstab_entry: -1}
sed -i "s/$new_fstab_entry/${new_fstab_entry} ${new_fstab_entry}/" /etc/fstab
fi
# Remount /var/tmp with configured options
mount -o remount,defaults,rw,nosuid,nodev,noexec,relatime "/var/tmp"
fi