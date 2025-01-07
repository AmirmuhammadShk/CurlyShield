module_name="rds"
module_type="net"
kernel_path="/lib/modules/**/kernel/$module_type"
for dir in $kernel_path; do
if [ -d "$dir" ]; then
# Check if directory contains module files
if [ -n "$(ls -A "$dir")" ]; then
echo -e "\n - Module: \"$module_name\" exists in \"$dir\"\n"
# Check if module is loadable
module_loadable=$(modprobe -n -v "$module_name")
if [ "$(wc -l <<< "$module_loadable")" -gt "1" ]; then
module_loadable=$(grep -P -- "(^\h*install|$module_name)\b" <<< "$module_loadable")
fi
# Check if module is loaded and add blacklist to /etc/modprobe.d
if ! grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$module_loadable"; then
echo -e "\n - Denying listing \"$module_name\""
echo -e "blacklist $module_name" >> /etc/modprobe.d/"$module_name".conf
# Check if module is not deny listed and add blacklist to /etc/modprobe.d
elif ! modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$module_name\b"; then
echo -e "\n - Denying listing \"$module_name\""
echo -e "blacklist $module_name" >> /etc/modprobe.d/"$module_name".conf
# Unload module if it's loaded
elif [ "$(lsmod | grep "$module_name")" > /dev/null 2>&1 ]; then
echo -e "\n - Unloading module \"$module_name\""
modprobe -r "$module_name"
fi
else
echo -e "\n - Module: \"$module_name\" doesn't exist in \"$dir\"\n"
fi
done
echo -e "\n - Remediation of module: \"$module_name\" complete\n"