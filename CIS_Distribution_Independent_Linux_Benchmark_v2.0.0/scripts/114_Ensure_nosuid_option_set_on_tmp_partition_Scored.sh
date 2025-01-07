echo "remounting /tmp with nosuid"
mount -o remount,nosuid /tmp
echo "Editing /etc/systemd/system/local-fs.target.wants/tmp.mount"
echo "Options=mode=1777,strictatime,noexec,nodev,nosuid" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
mount -o remount,nosuid /tmp