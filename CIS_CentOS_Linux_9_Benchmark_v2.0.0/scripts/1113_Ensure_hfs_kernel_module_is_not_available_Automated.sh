unset a_output; l_output3="" l_dl="y" # unset arrays and clear variables, set to ignore duplicate checks
l_mod_name="hfs" # set module name
l_mod_type="fs" # set module type
l_mod_path="$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)"
f_module_fix() {
while IFS= read -r l_showconfig; do
a_showconfig+=("$l_showconfig")
done < <(modprobe --showconfig | grep -P -- '\b(install|blacklist)\h+'"${l_mod_name//-/_}"'\b')
if lsmod | grep "$l_mod_name" &> /dev/null; then # Check if the module is currently loaded
a_output+=(" - unloading kernel module: \"$l_mod_name\"")
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
fi
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}"; then
a_output+=(" - setting kernel module: \"$l_mod_name\" to /bin/false")
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}"; then
a_output+=(" - denylisting kernel module: \"$l_mod_name\"")
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi
}
for l_mod_base_directory in $l_mod_path; do # Check if the module exists on the system
if [ -d "$l_mod_base_directory/${l_mod_name/-/\/}" ] && [ -n "$(ls -A $l_mod_base_directory/${l_mod_name/-/\/})" ]; then
l_output3="$l_output3\n  - \"$l_mod_base_directory\""
[[ "$l_mod_name" =~ overlay ]] && l_mod_name="${l_mod_name::-2}"
[ "$l_dl" != "y" ] && f_module_fix
else
echo -e " - kernel module: \"$l_mod_name\" doesn't exist in \"$l_mod_base_directory\""
fi
done
[ -n "$l_output3" ] && echo -e "\n -- INFO --\n - module: \"$l_mod_name\" exists in:$l_output3"
if [ "${#a_output[@]}" -gt 0 ]; then
printf '%s\n' "${a_output[@]}"
fi
echo -e "\n - remediation of kernel module: \"$l_mod_name\" complete"