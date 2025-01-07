for l_mdir in $(find /lib/modules/ -type d); do
# Check if the module exists and has subdirectories
if [ -d "$l_mdir" ]; then
# Get the full path of the module
l_mpath="$l_mdir/kernel"
# Create a blacklist file for the module
echo "blacklist $l_mname" >> /etc/modprobe.d/"$(basename "$l_mpath")".conf
# Check if the module is loadable
if [ -n "$(modprobe -n -v "$l_mname")" ]; then
# Unload the module if it's already loaded
echo "unloading module $l_mname"
modprobe -r "$l_mname"
fi
else
# If the kernel module is not available on the system, skip remediation
echo "module: \"$l_mname\" doesn't exist in any installed kernel"
fi
done
echo "remediation of module complete"