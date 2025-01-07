if lsmod | grep "rds"; then
# Unload and disable rds module
modprobe -r rds 2>/dev/null; rmmod rds 2>/dev/null
# Create file ending in .conf with install rds /bin/false in the /etc/modprobe.d/ directory
printf '%s\n' "install rds /bin/false" >> /etc/modprobe.d/rds.conf
# Create file ending in .conf with blacklist rds in the /etc/modprobe.d/ directory
printf '%s\n' "blacklist rds" >> /etc/modprobe.d/rds.conf
fi
l_mod_name="rds"
l_mod_type="net"
l_mod_path=$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)
if [ -d "$l_mod_path/rds" ] && [ -n "$(ls -A $l_mod_path/rds)" ]; then
# Set to ignore duplicate checks
l_dl="y"
# Create array with modprobe output
a_showconfig=()
while IFS= read -r l_showconfig; do
a_showconfig+=("$l_showconfig")
done < <(modprobe --showconfig | grep -P -- '\b(install|blacklist)\h+'"${l_mod_name//-/_}"'\b')
# Check if the module is currently loaded
if lsmod | grep "$l_mod_name" &> /dev/null; then
# Unload kernel module
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
# Add to output array
a_output2+=(" - unloading kernel module: \"$l_mod_name\"")
fi
# Check if the install configuration exists
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}"; then
# Set kernel module to /bin/false
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/$l_mod_name.conf
# Add to output array
a_output2+=(" - setting kernel  module: \"$l_mod_name\" to \"/bin/false\"")
fi
# Check if the blacklist configuration exists
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}"; then
# Add to output array
a_output2+=(" - denylisting kernel  module: \"$l_mod_name\"")
# Create blacklist configuration file
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/$l_mod_name.conf
fi
else
echo -e " - kernel module: \"$l_mod_name\" doesn't exist in \"$l_mod_path/rds\"\n"
fi
if [ "${#a_output2[@]}" -gt 0 ]; then
printf '%s\n' "${a_output2[@]}"
fi
[ -n "$l_mod_name" ] && echo -e "\n -- INFO --\n - module: \"$l_mod_name\" exists in $l_mod_path/rds\n"
echo -e "\n - remediation of kernel module: \"$l_mod_name\" complete\n"