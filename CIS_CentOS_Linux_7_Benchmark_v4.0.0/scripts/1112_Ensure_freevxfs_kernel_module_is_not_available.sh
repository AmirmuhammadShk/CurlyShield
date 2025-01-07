if grep -q "freevxfs" /proc/modules; then
# Create a file ending in .conf with blacklist freevxfs
echo "blacklist freevxfs" > /etc/modprobe.d/blacklist-freevxfs.conf
# Unload the freevxfs module from the kernel
modprobe -r freevxfs
# If the kernel module is not available on the system or pre-compiled into the kernel, no remediation is necessary
else
echo "freevxfs kernel module does not exist in the running kernel or any installed kernel"
fi