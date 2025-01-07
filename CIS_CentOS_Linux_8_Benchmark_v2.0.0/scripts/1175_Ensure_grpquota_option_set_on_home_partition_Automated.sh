sed -i 's/defaults/rw,usrquota,grpquota,nodev,relatime/' /etc/fstab
mount -o remount /home
if ! grep -q "jquota" /proc/mounts; then
echo "Enabling journaled quota"
sed -i '/^defaults/ s|^defaults|defaults,jquota' /etc/fstab
fi
quotacheck -cugv /home
if [ $(getenforce) != "enabled" ]; then
restorecon /home/aquota.group
fi
quotaon -vug /home