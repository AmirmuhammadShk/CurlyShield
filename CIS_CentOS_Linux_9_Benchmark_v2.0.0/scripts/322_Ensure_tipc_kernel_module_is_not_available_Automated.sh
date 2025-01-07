l_mod_name="tipc"
l_mod_type="net"
l_mod_path="$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)"
for l_mod_base_directory in $l_mod_path; do
if [ -d "$l_mod_base_directory/${l_mod_name/-/\/}" ] && [ -n "$(ls -A $l_mod_base_directory/${l_mod_name/-/\/})" ]; then
# If the module is loaded, unload it and set its state to false in /etc/modprobe.d/
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
else
echo " - kernel module: \"$l_mod_name\" doesn't exist in \"/$l_mod_base_directory\""
fi
done
if lsmod | grep "$l_mod_name" &> /dev/null; then
# If it is, unload and disable it
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
fi
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${l_mod_config[*]}"; then
# If not, set its state to /bin/false in /etc/modprobe.d/
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${l_mod_config[*]}"; then
# If not, blacklist it in /etc/modprobe.d/
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if [ -n "$l_output3" ]; then
echo -e "\n -- INFO --\n - module: \"$l_mod_name\" exists in:$l_output3"
fi
if [ "${#remediation_steps[@]}" -gt 0 ]; then
printf '%s\n' "${remediation_steps[*]}"
fi
echo -e "\n - remediation of kernel module: \"$l_mod_name\" complete"