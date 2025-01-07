if [ -d "/var" ]; then
# Edit the /etc/fstab file and add nosuid to the fourth field (mounting options) for the /var partition
echo "Adding nosuid option to /var partition in /etc/fstab" >&2
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/\ndefaults,rw,nosuid,nodev,noexec,relatime\nnosuid/' /etc/fstab
fi
echo "Remounting /var with nosuid option" >&2
mount -o remount /var