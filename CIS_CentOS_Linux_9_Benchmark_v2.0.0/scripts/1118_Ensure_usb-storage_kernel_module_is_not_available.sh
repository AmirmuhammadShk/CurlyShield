l_mod_name="usb-storage"
l_mod_type="drivers"
l_mod_path="$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)"
if lsmod | grep "$l_mod_name" &> /dev/null; then
# Unload and disable the module
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name"
fi
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${lsmod[*]}"; then
# Set the module to 'bin/false'
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${lsmod[*]}"; then
# Add a blacklist for the module
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
for l_mod_base_directory in $l_mod_path; do
if [ -d "$l_mod_base_directory/${l_mod_name/-/\/}" ] && [ -n "$(ls -A
$l_mod_base_directory/${l_mod_name/-/\/})" ]; then
# Check for an overlay version of the module
[[ "$l_mod_name" =~ overlay ]] && l_mod_name="${l_mod_name::-2}"
fi
done
if [ -n "$l_mod_name" ] && [ -n "$l_mod_path" ]; then
echo -e "\n -- INFO --\n - module: \"$l_mod_name\" exists in:$l_mod_path"
fi
echo -e "\n - remediation of kernel module: \"$l_mod_name\" complete\n"
rm -f /etc/modprobe.d/"$l_mod_name".conf
if [ "${lsmod[*]}" != *"$l_mod_name"* ]; then
echo "Kernel module $l_mod_name unloaded"
fi