l_mod_name="squashfs"
l_mod_type="fs"
l_mod_path="$(readlink -f /lib/modules/**/kernel/$l_mod_type | sort -u)"
f_module_fix() {
# Check if module is loaded
lsmod | grep "$l_mod_name" &> /dev/null && {
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name"
}
# Check for install config
! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${a_showconfig[*]}" && {
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
}
# Check for blacklist config
! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${a_showconfig[*]}" && {
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
}
}
for l_mod_base_directory in $l_mod_path; do
if [ -d "$l_mod_base_directory/${l_mod_name/-/\/}" ] && [ -n "$(ls -A $l_mod_base_directory/${l_mod_name/-/\/})" ]; then
# Output path where module exists
l_output3="$l_output3\n  - \"$l_mod_base_directory\""
# Remove overlay from module name if present
[[ "$l_mod_name" =~ overlay ]] && l_mod_name="${l_mod_name::-2}"
# Fix module if not already fixed
[ "$l_dl" != "y" ] && f_module_fix
else
echo -e " - kernel module: \"$l_mod_name\" doesn't exist in \"$l_mod_base_directory\""
fi
done
[l -n "$l_output3"] && echo -e "\n\n -- INFO --\n - module: \"$l_mod_name\" exists in:$l_output3"
[ "${#a_output2[@]}" -gt 0 ] && printf '%s\n' "${a_output2[@]}"
echo -e "\n - remediation of kernel module: \"$l_mod_name\" complete"