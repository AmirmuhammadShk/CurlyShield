if [ -d /tmp ]; then
# Get current mounting options
current_options=$(cat /etc/fstab | grep "/tmp")
# If no matching line found, exit
if [ -z "$current_options" ]; then
echo "No /tmp partition found in fstab file."
exit 1
fi
# Extract options from current line
read -r device fstype defaults rw nosuid nodev <<< "$current_options"
# Add noexec option to the fourth field
updated_device=$(echo "${device%% *}" | tr -d '[:space:]')
updated_fstype=$(echo "${fstype%% *}" | tr -d '[:space:]')
updated_defaults=${defaults#* }
updated_nosuid=${nosuid#* }
updated_nodev=${nodev#* }
updated_options="defaults,rw,nosuid,nodev,noexec,relatime"
# Update fstab file
echo "${updated_device} ${updated_fstype} ${updated_defaults},${updated_options}" >> /etc/fstab
# Remount /tmp with new options
mount -o remount /tmp
else
# Add noexec option to the mounting options for /tmp partition
echo "/devtmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" >> /etc/fstab
# Remount /tmp with configured options
mount -o remount /tmp
fi