edit_fstab() {
sed -i 's/defaults,rw,nosuid,nodev,noexec,relatime/defaults,rw,nosuid,nodev,noexec,relatime,nosuid/' /etc/fstab
}
remount_var() {
mount -o remount /var
}
edit_fstab
remount_var