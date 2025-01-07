l_mod_name="hfsplus"
l_mod_type="fs"
l_mod_path=$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)
if [ -d "$l_mod_base_directory/${l_mod_name/-/\/}" ] && [ -n "$(ls -A $l_mod_base_directory/${l_mod_name/-/\/})" ]; then
echo " - kernel module: \"$l_mod_name\" exists in: $l_mod_base_directory"
fi
if lsmod | grep "$l_mod_name" &> /dev/null; then
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
fi
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}"; then
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}"; then
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if [ -n "${a_showconfig[*]}" ] && ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}"; then
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if [ -n "${a_showconfig[*]}" ] && ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}"; then
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if [ "$l_dl" != "y" ] && f_module_fix; then
# Set to ignore duplicate checks
l_dl="y"
# Create array with modprobe output
a_showconfig=()
while IFS= read -r l_showconfig; do
a_showconfig+=("$l_showconfig")
done < <(modprobe --showconfig | grep -P -- '\b(install|blacklist)\h+'"${l_mod_name//-/_}"'\b')
# Check if the module is currently loaded
if lsmod | grep "$l_mod_name" &> /dev/null; then
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
fi
# Set kernel module to /bin/false or blacklist it if not already done
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}"; then
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}"; then
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
# Check for kernel module overlay and adjust the mod name accordingly
if [ "$l_dl" != "y" ] && f_module_fix; then
echo " - remediation of kernel module: \"$l_mod_name\" complete"
else
echo " - remediation of kernel module: «$l_mod_name» is not supported or has been disabled."
fi
fi