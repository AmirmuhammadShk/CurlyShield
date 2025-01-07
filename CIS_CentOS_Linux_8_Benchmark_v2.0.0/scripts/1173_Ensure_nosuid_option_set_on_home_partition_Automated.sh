echo "device  fstype  defaults,rw,nosuid,nodev,noexec,relatime" | sed 's/ / /g' > tmpfstype
awk -F: '{print $1,$2,$3","tmpfstype$4}' /etc/fstab > tmpfstab
cat << EOF >> /etc/fstab
$(cat tmpfstab)
EOF
mount -o remount /home