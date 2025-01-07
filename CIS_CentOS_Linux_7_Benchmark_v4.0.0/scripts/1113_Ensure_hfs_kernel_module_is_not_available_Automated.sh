l_mname="hfs"
l_mtype="fs"
l_mpath="/lib/modules/**/kernel/$l_mtype"
l_mpname="$(tr '-' '_' <<< "$l_mname")"
l_mndir="$(tr '-' '/' <<< "$l_mname")"
module_deny_fix() {
# If the module isn't deny listed, denylist the module
if ! modprobe --showconfig | grep -Pq -- "^\s*blacklist\s+$l_mpname\b"; then
echo -e "\n - deny listing \"$l_mname\""
echo -e "blacklist $l_mname" >> /etc/modprobe.d/"$l_mpname".conf
fi
}
module_loadable_fix() {
# If the module is currently loadable, add "install {MODULE_NAME} /bin/false" to a file in "/etc/modprobe.d"
l_loadable="$(modprobe -n -v "$l_mname")"
if grep -Pq -- "(^\s*install|\b$l_mname)\b" <<< "$l_loadable"; then
echo -e "\n - setting module: \"$l_mname\" to be not loadable"
echo -e "install $l_mname /bin/false" >> /etc/modprobe.d/"$l_mpname".conf
fi
}
module_loaded_fix() {
# If the module is currently loaded, unload the module
if lsmod | grep "$l_mname" > /dev/null 2>&1; then
echo -e "\n - unloading module \"$l_mname\""
modprobe -r "$l_mname"
fi
}
for l_mdir in $l_mpath; do
if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
echo -e "\n - module: \"$l_mname\" exists in \"$l_mdir\"\n - checking if disabled..."
module_deny_fix
else
echo -e "\n - module: \"$l_mname\" doesn't exist in \"$l_mdir\"\n"
fi
done
echo -e "\n - remediation of module: \"$l_mname\" complete\n"