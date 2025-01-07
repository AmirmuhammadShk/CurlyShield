if grep -q "dccp" /proc/modules; then
echo "Running dccp module removal script..."
# Create a file with install dccp /bin/false in the /etc/modprobe.d/ directory
mkdir -p /etc/modprobe.d/
echo "install dccp /bin/false" >> /etc/modprobe.d/dccp.conf
# Unload dccp from the kernel
modprobe -r dccp
# Check if the module exists on the system
for l_mdir in /lib/modules/**/kernel/net; do
if [ -d "$l_mdir" ] && [ -n "$(ls -A $l_mdir)" ]; then
echo "Module: dccp exists in $l_mdir"
# Create a file with blacklist dccp in the /etc/modprobe.d/ directory
mkdir -p /etc/modprobe.d/
echo "blacklist dccp" >> /etc/modprobe.d/dccp.conf
# If the kernel module is not available on the system or pre-compiled into the kernel:
# No remediation is necessary
fi
done
echo "Remediation of module dccp complete"
else
echo "Module dccp is not loaded."
fi