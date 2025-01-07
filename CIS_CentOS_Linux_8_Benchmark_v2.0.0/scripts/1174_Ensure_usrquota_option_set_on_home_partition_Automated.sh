echo "defaults,rw,usrquota,grpquota,nodev,relatime" >> /etc/fstab
mount -o remount /home
quotacheck -cugv /home || true
restorecon /home/aquota.user
quotaon -vug /home