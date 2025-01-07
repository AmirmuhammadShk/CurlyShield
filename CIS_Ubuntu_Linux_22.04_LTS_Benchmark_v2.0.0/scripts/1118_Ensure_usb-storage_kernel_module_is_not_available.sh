for l_mdir in /lib/modules/**/kernel/$l_mtype; do
if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
echo "Module: \"$l_mname\" exists in \"$l_mdir\""
module_deny_fix
if [ "$l_mdir" = "/lib/modules/$(uname -r)/kernel/$l_mtype" ]; then
module_loadable_fix
module_loaded_fix
fi
else
echo "Module: \"$l_mname\" doesn't exist in \"$l_mdir\""
fi
done
echo "Remediation of module: \"$l_mname\" complete"
l_mname="usb-storage"
l_mtype="drivers"
blacklist_file="/etc/modprobe.d/$l_mpname.conf"
if [ ! -f "$blacklist_file" ]; then
echo "blacklist $l_mname" >> "$blacklist_file"
fi
loadable=$(modprobe -n -v "$l_mname")
if [ "$(wc -l <<< "$loadable")" -gt "1" ] && ! grep -Pq -- "(^\h*install|\b$l_mname)\b" <<< "$loadable"; then
echo "install $l_mname /bin/false" >> "$blacklist_file"
fi
if lsmod | grep "$l_mname" > /dev/null 2>&1; then
echo "unloading module \"$l_mname\""
modprobe -r "$l_mname"
fi