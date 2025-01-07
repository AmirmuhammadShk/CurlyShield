if grep -q "jffs2" /proc/modules; then
# Create file to disable the module
echo "install jffs2 /bin/false" > /etc/modprobe.d/jffs2.conf
# Blacklist jffs2 in all installed kernels
echo "blacklist jffs2" >> /etc/modprobe.d/blacklist-jffs2.conf
# Unload jffs2 from the kernel
modprobe -r jffs2
else
# No remediation necessary if module is not available
:
fi
for dir in /lib/modules/**/kernel/*; do
# Check if module exists and is enabled
if [ -d "$dir" ] && ls -A "$dir" | grep -q "jffs2"; then
echo "Module jffs2 found in $dir, disabling..."
# Create blacklist file to disable the module
echo "blacklist jffs2" >> /etc/modprobe.d/blacklist-jffs2.conf
# Unload the module
modprobe -r jffs2
else
echo "Module jffs2 not found in $dir"
fi
done
echo "Remediation of module jffs2 complete"