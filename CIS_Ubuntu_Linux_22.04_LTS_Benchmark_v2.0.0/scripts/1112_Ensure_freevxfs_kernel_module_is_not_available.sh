module_name="freevxfs"
if modprobe -n -v "$module_name" > /dev/null 2>&1; then
# Create a file ending in .conf with install freevxfs /bin/false in the /etc/modprobe.d/ directory
echo "install $module_name /bin/false" >> /etc/modprobe.d/"$module_name".conf
# Create a file ending in .conf with blacklist freevxfs in the /etc/modprobe.d/ directory
echo "blacklist $module_name" >> /etc/modprobe.d/"$module_name".conf
# Unload the module from the kernel
modprobe -r "$module_name"
fi
for dir in $(find /lib/modules -type d); do
if [ "${dir##*/}" == "$(uname -r)/kernel/$module_name" ]; then
# Create a file ending in .conf with blacklist freevxfs in the /etc/modprobe.d/ directory
echo "blacklist $module_name" >> /etc/modprobe.d/"$module_name".conf
# Check if the module is currently loadable
loaded=$(modprobe -n -v "$module_name")
if [ "$(grep -P "(^\h*install|\b$l_module_name)\b" <<< "$loaded")" == "" ]; then
# Set the module to be not loadable
echo "install $module_name /bin/false" >> /etc/modprobe.d/"$module_name".conf
# Unload the module from the kernel
modprobe -r "$module_name"
fi
break
fi
done
echo "Remediation of module: '$module_name' complete"