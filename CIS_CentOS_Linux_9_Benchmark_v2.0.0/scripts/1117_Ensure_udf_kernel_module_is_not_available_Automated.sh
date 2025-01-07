unset a_output2; l_output3="" l_dl="" # unset arrays and clear variables
l_mod_name="udf" # set module name
l_mod_type="fs" # set module type
l_mod_path="$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)"
f_module_fix() {
if [ "$l_dl" != "y" ]; then f_module_fix; fi
l_dl="y" # Set to ignore duplicate checks
a_showconfig=() # Create array with modprobe output
while IFS= read -r l_showconfig; do
a_showconfig+=("$l_showconfig")
done < <(modprobe --showconfig | grep -P -- '\b(install|blacklist)\h+'"${l_mod_name//-/_}"'\b')
if [ $(lsmod | grep "$l_mod_name" &> /dev/null) -eq 0 ]; then # Check if the module is not currently loaded
a_output2+=(" - unloading kernel module: \"$l_mod_name\"")
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
fi
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}"; then
a_output2+=(" - setting kernel  module: \"$l_mod_name\" to /bin/false")
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}"; then
a_output2+=(" - denylisting kernel  module: \"$l_mod_name\"")
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
}
for l_mod_base_directory in $(readlink -f /lib/modules/${l_mod_type}/${l_mod_name/-/\/}); do # Check if the module exists on the system
if [ -d "$l_mod_base_directory" ] && [ -n "$(ls -A $l_mod_base_directory/$l_mod_name/-/)" ]; then
l_output3+="$l_mod_base_directory\n"
[[ "$l_mod_name" =~ overlay ]] && l_mod_name="${l_mod_name::-2}"
else
echo -e " - kernel module: \"$l_mod_name\" doesn't exist in \"${l_mod_base_directory}\""
fi
done
if [ -n "$l_output3" ]; then
echo -e "\n -- INFO --\n - module: \"$l_mod_name\" exists in:$l_output3"
fi
if [ ${#a_output2[@]} -gt 0 ]; then
for output in "${a_output2[@]}"; do
printf '%s\n' "$output"
done
fi
echo -e "\n - remediation of kernel module: \"$l_mod_name\" complete"
if [ $(lsmod | grep "udf") -ne 0 ]; then
printf '%s\n' "install udf /bin/false" >> /etc/modprobe.d/"udf".conf
printf '%s\n' "blacklist udf" >> /etc/modprobe.d/"udf".conf
modprobe -r udf 2>/dev/null; rmmod udf 2>/dev/null
fi
if [ $(lsmod | grep "udf") -eq 0 ]; then
if [ ! -f /etc/modprobe.d/"udf".conf ]; then
echo "Error: udf blacklist configuration file does not exist"
fi
fi