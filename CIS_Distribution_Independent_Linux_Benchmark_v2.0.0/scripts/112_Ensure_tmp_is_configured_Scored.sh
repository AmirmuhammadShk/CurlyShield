cat >> /etc/fstab <<EOF
tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0
EOF
systemctl unmask tmp.mount
systemctl enable tmp.mount
echo "[Mount]" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "tmpfs" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Where=/tmp" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Type=tmpfs" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Options=mode=1777,strictatime,noexec,nodev,nosuid" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
if [ -n "$1" ]; then
echo "[Mount]" > /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "tmpfs" > /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Where=/tmp" > /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Type=tmpfs" > /etc/systemd/system/local-fs.target.wants/tmp.mount
echo "Options=mode=1777,strictatime,noexec,nodev,nosuid,size=${1}" >> /etc/systemd/system/local-fs.target.wants/tmp.mount
fi