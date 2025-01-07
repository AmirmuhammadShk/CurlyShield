sctp_name="sctp"
sctp_type="net"
all_modules=$(modprobe -n -v | grep "$sctp_name")
if [ $(wc -l <<< "$all_modules") -gt "1" ]; then
all_loadable=$(grep -P "(^\h*install|$sctp_name)\b" <<< "$all_modules")
else
all_loadable=$all_modules
fi
if [ "$(lsmod | grep "$sctp_name")" > /dev/null 2>&1 ]; then
echo -e "\n - unloading module \"$sctp_name\""
modprobe -r "$sctp_name"
fi
if ! grep -Pq -- "^\h*blacklist\h+$sctp_name\b" /etc/modprobe.d/*.conf; then
echo -e "\n - deny listing \"$sctp_name\""
echo -e "blacklist $sctp_name" >> /etc/modprobe.d/"$sctp_name".conf
fi
for module_dir in $(find /lib/modules/$(uname -r)/kernel/$sctp_type -type d); do
module_path=$module_dir
module_name=$(basename "$module_path")
if [ -d "$module_path/$sctp_name" ] && [ -n "$(ls -A $module_path/$sctp_name)" ]; then
echo -e "\n - module: \"$sctp_name\" exists in \"$module_path\"\n - checking if disabled..."
# Check if the module is currently loadable and deny listing
if ! grep -Pq -- "^\h*install\|"$sctp_name"\b" <<< "$all_loadable"; then
echo -e "\n - setting module: \"$sctp_name\" to be not loadable"
echo -e "install $sctp_name /bin/false" >> /etc/modprobe.d/"$sctp_name".conf
fi
# Check if the module is currently loaded and deny listing
if [ "$(lsmod | grep "$sctp_name")" > /dev/null 2>&1 ]; then
echo -e "\n - unloading module \"$sctp_name\""
modprobe -r "$sctp_name"
fi
# Check if the module isn't deny listed, denylist the module
if ! grep -Pq -- "^\h*blacklist\h+$sctp_name\b" /etc/modprobe.d/*.conf; then
echo -e "\n - deny listing \"$sctp_name\""
echo -e "blacklist $sctp_name" >> /etc/modprobe.d/"$sctp_name".conf
fi
else
echo -e "\n - module: \"$sctp_name\" doesn't exist in \"$module_path\"\n"
fi
done
echo -e "\n - remediation of module: \"$sctp_name\" complete"