module_name="freevxfs"
module_type="fs"
kernel_path="/lib/modules/**/kernel/$module_type"
module_name_base=$(tr '-' '_' <<< "$module_name")
module_name_dir=$(tr '-' '/' <<< "$module_name")
if ! module_loadable=$(modprobe -n -v "$module_name"); then
echo "Module $module_name is not available in any installed kernel"
else
# Filter out install command lines
module_loadable=$(echo "$module_loadable" | grep -P -- "(^\h*install|\b$l_module_name)\b")
# Check if the module is currently loadable
if echo "$module_loadable" | wc -l -gt "1"; then
module_loadable=$(echo "$module_loadable" | grep -P -- "(^\h*install|\b$l_module_name)\b")
# Add install command to disable the module
if ! echo "$module_loadable" | grep -Pq -- "^\h*install \/bin\/(true|false)"; then
echo "Module $module_name is currently loadable"
echo "install $module_name /bin/false" >> "/etc/modprobe.d/$module_name_base.conf"
fi
else
echo "Module $module_name is not currently loadable"
fi
# Check if the module is loaded
if lsmod | grep "$module_name"; then
echo "Unloading module $module_name"
modprobe -r "$module_name"
fi
# Add blacklist command to prevent loading the module in future
if ! echo "/etc/modprobe.d/$module_name_base.conf" | grep -Pq -- "^\h*blacklist\h+$module_name_base\b"; then
echo "Module $module_name is not blacklisted"
echo "blacklist $module_name" >> "/etc/modprobe.d/$module_name_base.conf"
fi
# Check if the module exists on the system
for path in $kernel_path; do
if [ -d "$path/$module_name_dir" ] && [ -n "$(ls -A "$path/$module_name_dir")" ]; then
echo "Module $module_name exists in path $path"
# If it is, disable the module
module_deny_fix
# Check if it's being loaded from this kernel version
if [ "$path" = "$kernel_path" ]; then
# Disable the module by adding install command to /etc/modprobe.d/$module_name_base.conf
module_loadable=$(modprobe -n -v "$module_name")
module_loadable=$(echo "$module_loadable" | grep -P -- "(^\h*install|\b$l_module_name)\b")
if ! echo "$module_loadable" | grep -Pq -- "^\h*install \/bin\/(true|false)"; then
echo "Module $module_name is currently loadable"
echo "install $module_name /bin/false" >> "/etc/modprobe.d/$module_name_base.conf"
fi
else
# If it's not, just blacklist the module
module_deny_fix
fi
else
echo "Module $module_name does not exist in path $path"
fi
done
echo "Remediation of module $module_name complete"