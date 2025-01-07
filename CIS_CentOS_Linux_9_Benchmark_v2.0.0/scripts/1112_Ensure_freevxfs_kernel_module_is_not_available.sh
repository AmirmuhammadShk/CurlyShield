modprobe -r freevxfs 2>/dev/null; rmmod freevxfs 2>/dev/null
l_mod_name="freevxfs"
l_mod_type="fs"
if lsmod | grep "$l_mod_name" &> /dev/null; then
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name" 2>/dev/null
fi
if ! grep -Pq -- '\binstall\h+'"${l_mod_name//-
/_}"'\h+\/bin\/(true|false)\b' <<< "${lsmod_output[*]}"; then
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
fi
if ! grep -Pq -- '\bblacklist\h+'"${l_mod_name//-/_}"'\b' <<< "${lsmod_output[*]}"; then
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf
fi