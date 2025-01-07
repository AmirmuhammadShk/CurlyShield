if [ -d "/var" ]; then
# Edit fstab file and add nodev option to /var partition
echo "nodev" >> "/etc/fstab"
fi
mount -o remount /var