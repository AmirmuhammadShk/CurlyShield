systemctl stop dnsmasq.service
dnf remove --force --allmatches dnsmasq || { echo "Error: Could not remove dnsmasq package"; }
if dnf list installed | grep -q ^dnsmasq; then
systemctl mask dnsmasq.service || { echo "Error: Could not mask dnsmasq service"; }
fi