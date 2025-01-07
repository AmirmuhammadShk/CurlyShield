echo "Adding noexec option to /dev/shm partition in fstab" >> /var/log/audit.log
sed -i 's/noexec//g' /etc/fstab || echo "Error editing /etc/fstab"
echo "/dev/shm  XFS defaults,noexec,errors=ignore,discard      " >> /etc/fstab
echo "Remounting /dev/shm with noexec option" >> /var/log/audit.log
mount -o remount,noexec /dev/shm