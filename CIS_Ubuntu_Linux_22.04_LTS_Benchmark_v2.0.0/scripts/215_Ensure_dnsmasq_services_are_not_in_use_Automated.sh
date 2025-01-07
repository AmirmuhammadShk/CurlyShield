systemctl stop dnsmasq.service
apt purge dnsmasq || true
systemctl mask dnsmasq.service