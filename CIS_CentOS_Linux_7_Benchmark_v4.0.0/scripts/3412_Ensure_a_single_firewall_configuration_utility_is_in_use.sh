echo "Choose a firewall utility to use:"
if [ "$1" = "FirewallD" ]; then
# Uninstall nftables and iptables-services if necessary
if [ "$(yum list installed | grep nftables | wc -l)" -eq 0 ] || [ "$(yum list installed | grep iptables-services | wc -l)" -eq 0 ]; then
yum remove nftables iptables-services
else
# Stop and mask nftables.service,iptables.service, and ip6tables.service if necessary
systemctl stop nftables.service iptables.service ip6tables.service
systemctl mask nftables.service iptables.service ip6tables.service
fi
# Configure firewalld
echo "Follow the guidance in subsection \"Configure firewalld\""
elif [ "$1" = "NFTables" ]; then
# Uninstall firewalld and iptables-services if necessary
if [ "$(yum list installed | grep firewalld | wc -l)" -eq 0 ] || [ "$(yum list installed | grep iptables-services | wc -l)" -eq 0 ]; then
yum remove firewalld iptables-services
else
# Stop and mask firewalld.service,iptables.service, and ip6tables.service if necessary
systemctl stop firewaldd.service iptables.service ip6tables.service
systemctl mask firewaldd.service iptables.service ip6tables.service
fi
# Configure nftables
echo "Follow the guidance in subsection \"Configure nftables\""
elif [ "$1" = "IPTables" ]; then
# Uninstall nftables and iptables-services if necessary
if [ "$(yum list installed | grep nftables | wc -l)" -eq 0 ] || [ "$(yum list installed | grep iptables-services | wc -l)" -eq 0 ]; then
yum remove firewalld nftables
else
# Stop and mask firewaldd.service and nftables.service if necessary
systemctl stop firewaldd.service nftables.service
systemctl mask firewaldd.service nftables.service
fi
# Configure iptables
echo "Follow the guidance in subsection \"Configure iptables\""
else
echo "Invalid choice. Please choose a valid firewall utility."
fi