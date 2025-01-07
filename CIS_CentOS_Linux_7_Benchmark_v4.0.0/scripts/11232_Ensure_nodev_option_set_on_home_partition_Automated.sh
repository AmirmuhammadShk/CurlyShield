if [ -d "/home" ]; then
# Edit the /etc/fstab file and add nodev to the mounting options
echo "nodev" >> "/etc/fstab"
else
# Print a message indicating that no separate /home partition was found
echo "No separate /home partition found."
fi
echo "Remounting /home with nodev option:"
mount -o remount /home