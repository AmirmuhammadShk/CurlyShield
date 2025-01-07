if [ -d /home ]; then
# Get current fstab content
fstab_content=$(cat /etc/fstab)
# Split the fourth field (mounting options) from the rest of the line
IFS=: read -r device mountpoint fstype _ <<< "$fstab_content"
if [ "${fstype: -1}" == "x" ]; then
# Update mounting options to include nodev option
updated_fstab=$(sed -i "/^${device} /home ${fstype}/s/defaults,rw,nosuid,relatime/\1defaults,rw,nodev,relatime/" /etc/fstab)
else
# If fstype is not 'x', it means nodev option was not set before.
updated_fstab=$(sed -i "/^${device} /home ${fstype}/s/^/defaults,rw,nosuid,nodev,relatime/" /etc/fstab)
fi
# Write the updated fstab content
echo "$updated_fstab" > /etc/fstab
# Remount /home with the configured options
mount -o remount /home
fi