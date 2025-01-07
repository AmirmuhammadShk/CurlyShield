module_name="usb-storage"
module_type="drivers"
kernel_modules_dir=$(uname -r)/kernel/$module_type
for dir in $(ls -A $kernel_modules_dir); do
if [ -n "$(ls -A "$dir")" ]; then
# Create a blacklist file for the module
echo "blacklist $module_name" >> /etc/modprobe.d/"$module_name".conf
# Check if the module is currently loadable
module_loadable=$(modprobe -n -v "$module_name")
[ "$(wc -l <<< "$module_loadable")" -gt "1" ] && module_loadable=$(grep -P "(^\h*install|\b$module_name)\b" <<< "$module_loadable")
if ! grep -Pq -- '^\h*install /bin/(true|false)' <<< "$module_loadable"; then
echo -e "\n - setting module: \"$module_name\" to be not loadable"
echo "install $module_name /bin/false" >> /etc/modprobe.d/"$module_name".conf
fi
# Check if the module is currently loaded
if lsmod | grep "$module_name" > /dev/null 2>&1; then
echo -e "\n - unloading module \"$module_name"""
modprobe -r "$module_name"
fi
fi
done
echo -e "\n - remediation of module: \"$module_name\" complete"
# Update the system to apply the changes
sudo systemctl restart kerneloopsd
# Remove any remaining files from /etc/modprobe.d/
rm -f /etc/modprobe.d/*.conf