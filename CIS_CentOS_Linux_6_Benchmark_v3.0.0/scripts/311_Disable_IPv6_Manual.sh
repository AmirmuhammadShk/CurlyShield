echo "Disabling IPv6 through GRUB config" >&2
sed -i 's/ro /ro ipv6.disable=1 /' /boot/grub/grub.conf
echo "Disabling IPv6 through sysctl settings"
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.route.flush=1