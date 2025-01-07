module_name="cramfs"
module_type="fs"
kernel_path="/lib/modules/${UNAME_R}/kernel/$module_type"
mkdir -p "$kernel_path/$module_name"
if [ -d "$kernel_path" ]; then
# If it does, unload and blacklist the module
modprobe -r "$module_name"
echo "blacklist $module_name" > /etc/modprobe.d/"$module_name".conf
else
# If not, create a new directory for the module
mkdir -p "$kernel_path/$module_name"
fi
if modprobe -n -v "$module_name" | grep -P '(^\s*install|\b$cramfs\b)' > /dev/null; then
# If it's not blacklisted, create a new .conf file to mark it as unloadable
echo "install $module_name /bin/false" >> /etc/modprobe.d/"$module_name".conf
fi