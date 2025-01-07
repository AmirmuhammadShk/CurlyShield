if ! grep -q "hfs" /proc/modules; then
echo "hfs module not found in running kernel"
else
# Create a file with blacklist hfs in the /etc/modprobe.d/ directory
echo "blacklist hfs" > /etc/modprobe.d/blacklist_hfs.conf
# Unload hfs from the kernel
modprobe -r hfs
fi
hfs="hfs"
hfs_type="fs"
modules_path="/lib/modules/**/kernel/$hfs_type"
for dir in $modules_path; do
if [ -d "$dir" ]; then
# Check if module is loaded and has a blacklist entry
modprobe -n -v $hfs | grep install > /dev/null 2>&1 || \
! grep -q "blacklist $hfs" /etc/modprobe.d/*
# If module exists, set it to be not loadable
if [ "$(grep -c 'install hfs' <<< "$modprobe -n -v $hfs")" -eq 0 ]; then
echo -e "\n - setting module: \"$hfs\" to be not loadable"
echo "install $hfs /bin/false" > /etc/modprobe.d/$hfs.conf
fi
# Check if module is loaded and unload it if necessary
if lsmod | grep $hfs > /dev/null 2>&1; then
echo -e "\n - unloading module \"$hfs\""
modprobe -r $hfs
fi
# Add blacklist entry for the next kernel update
if ! grep -q "blacklist $hfs" /etc/modprobe.d/*; then
echo -e "\n - deny listing \"$hfs\""
echo "blacklist $hfs" > /etc/modprobe.d/$hfs.conf
fi
else
# Module doesn't exist in running kernel
echo -e "\n - module: \"$hfs\" doesn't exist in \"$modules_path\"\n"
fi
done
echo -e "\n - remediation of module: \"$hfs\" complete\n"