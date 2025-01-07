sed -i '/^/ { s/^ #\(.*\)/# \1 nodev/' /etc/fstab
echo "Updated fstab file with nodev option for removable media partitions."