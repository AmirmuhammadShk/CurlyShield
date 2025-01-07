if [ -d "/var/log" ]; then
# Edit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /var/log partition
sed -i 's/defaults,rw,nosuid//; s/.*nodev/.nodev/' /etc/fstab
fi
echo "Remounting /var/log with nodev option"
mount -o remount,defaults /var/log