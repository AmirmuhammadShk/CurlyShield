systemctl stop rsyncd.socket
systemctl stop rsyncd.service
dnf remove rsync-daemon
OR
if dpkg -s rsync-daemon &> /dev/null; then
systemctl stop rsyncd.socket
systemctl stop rsyncd.service
systemctl mask rsyncd.socket
systemctl mask rsyncd.service
fi