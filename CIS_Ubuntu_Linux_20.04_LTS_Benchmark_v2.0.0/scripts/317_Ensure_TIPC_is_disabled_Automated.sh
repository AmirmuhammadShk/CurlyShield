module_name="tipc"
module_type="net"
module_path="/lib/modules/**/kernel/$module_type"
mod_name=$(tr '-' '_' <<< "$module_name")
module_dir=$(tr '-' '/' <<< "$module_name")
module_loadable_fix() {
local module_loadable
module_loadable=$(modprobe -n -v "$module_name")
if [ "$(wc -l <<< "$module_loadable")" -gt "1" ]; then
module_loadable=$(grep -P -- "(^\h*install|\b$l_mod_name)\b" <<< "$module_loadable")
fi
if ! grep -Pq -- '^\h*install \/bin\/(true|false)' <<< "$module_loadable"; then
echo -e "\n - setting module: \"$module_name\" to be not loadable"
echo -e "install $mod_name /bin/false" >> /etc/modprobe.d/"$mod_name".conf
fi
}
module_loaded_fix() {
if lsmod | grep "$module_name" > /dev/null 2>&1; then
echo -e "\n - unloading module \"$module_name"""
modprobe -r "$module_name"
fi
}
module_deny_fix() {
if ! modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$mod_name\b"; then
echo -e "\n - deny listing \"$module_name"""
echo -e "blacklist $mod_name" >> /etc/modprobe.d/"$mod_name".conf
fi
}
for module_dir in $module_path; do
if [ -d "$module_dir/$module_dir" ] && [ -n "$(ls -A $module_dir/$module_dir)" ]; then
echo -e "\n - module: \"$module_name\" exists in \"$module_dir\"\n - checking if disabled..."
module_deny_fix
if [ "$module_dir" = "/lib/modules/$(uname -r)/kernel/$module_type" ]; then
module_loadable_fix
module_loaded_fix
fi
else
echo -e "\n - module: \"$module_name\" doesn't exist in \"$module_dir\"\n"
fi
done
echo -e "\n - remediation of module: \"$module_name\" complete\n"