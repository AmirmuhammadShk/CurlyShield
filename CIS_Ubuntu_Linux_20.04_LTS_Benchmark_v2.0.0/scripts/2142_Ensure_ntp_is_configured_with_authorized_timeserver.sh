sed -i '/^[[:space:]]*server/ s/[^ ]*/\1 iburst/' /etc/ntp.conf
sed -i '/^[[:space:]]*pool/ s/[^ ]*/\1 iburst/' /etc/ntp.conf
systemctl restart ntp
if apt list --upgradable | grep ntp; then
apt purge ntp
fi