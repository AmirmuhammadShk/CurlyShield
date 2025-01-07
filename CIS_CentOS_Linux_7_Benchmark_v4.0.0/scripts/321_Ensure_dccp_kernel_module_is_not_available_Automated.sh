if grep -q "dccp" /etc/modprobe.conf; then
echo "Running script to disable dccp module"
sed -i '/^blacklist/d' /etc/modprobe.conf
echo "blacklist dccp" >> /etc/modprobe.d/blacklist.d/cdcp.conf
fi
if grep -q "dccp" /usr/lib/modprobe.d/; then
echo "Running script to disable dccp module"
sed -i '/^install/d' /usr/lib/modprobe.d/*
echo "install dccp /bin/false" >> /etc/modprobe.d/blacklist.d/cdcp.conf
fi
echo "Checking if dccp module exists on the system"
for kernel in /lib/modules/**/kernel/net; do
if [ -d "$kernel/dccp" ] && [ -n "$(ls -A $kernel/dccp)" ]; then
echo "Module: dccp exists in $kernel"
echo "Deny listing dccp"
sed -i '/^blacklist/d' /usr/lib/modprobe.d/*
echo "install dccp /bin/false" >> /etc/modprobe.d/blacklist.d/cdcp.conf
else
echo "Module: dccp doesn't exist in $kernel"
fi
done
echo "Remediation of module: dccp complete"