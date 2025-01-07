systemctl stop squid.service
if ! yum list installed | grep -q "squid"; then
# Mask squid service to prevent automatic start on boot
systemctl mask squid.service
# Remove squid package
yum remove squid
else
# Mask squid service
systemctl mask squid.service
fi