if [ -d "/var" ]; then
# Edit fstab file and add nodev option to /var partition
echo "nodev" >> "/etc/fstab"
# Remount /var with configured options
mount -o remount /var
fi