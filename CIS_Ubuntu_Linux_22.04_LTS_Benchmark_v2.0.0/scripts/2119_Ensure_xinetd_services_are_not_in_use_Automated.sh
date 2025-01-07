if [ -f /etc/xinetd.conf ]; then
# Remove any existing xinetd services
sed -i '/^service/,/^\$/d' /etc/xinetd.conf
fi
systemctl stop xinetd.service || true
systemctl mask xinetd.service || true