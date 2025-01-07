l_mod_name="sctp"
l_mod_type="net"
if grep -Pq -- '\b(install|blacklist)\h+'"${l_mod_name//-
/_}"'\b' < /etc/modprobe.d/"$l_mod_name".conf; then
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name"
fi
if lsmod | grep "$l_mod_name" &> /dev/null; then
modprobe -r "$l_mod_name" 2>/dev/null; rmmod "$l_mod_name"
fi
printf '%s\n' "install $l_mod_name /bin/false" >> /etc/modprobe.d/"$l_mod_name".conf
printf '%s\n' "blacklist $l_mod_name" >> /etc/modprobe.d/"$l_mod_name".conf