hfs_kernel_module_remediation() {
local mname="hfs"
local mtype="fs"
local mpath="/lib/modules/**/kernel/$mtype"
local mpname=$(tr '-' '_' <<< "$mname")
local mndir=$(tr '-' '/' <<< "$mname")
if modprobe -n -v "$mname" | grep -Pq -- "(^\h*install|\b$l_mname)\b"; then
echo "Module $mname is available in the running kernel. Disabling and blacklisting."
echo "install $mname /bin/false" >> /etc/modprobe.d/"$mpname".conf
echo "blacklist $mname" >> /etc/modprobe.d/"$mpname".conf
else
echo "Module $mname is not available. No remediation necessary."
fi
module_loadable_fix() {
local mname="$1"
if modprobe -n -v "$mname" | grep -Pq -- "(^\h*install|\b$l_mname)\b"; then
echo "Module $mname is currently loadable. Adding 'install {MODULE_NAME} /bin/false' to blacklist."
echo "install $mname /bin/false" >> /etc/modprobe.d/"$mpname".conf
fi
}
module_loaded_fix() {
local mname="$1"
if lsmod | grep "$mname" > /dev/null; then
echo "Module $mname is currently loaded. Unloading."
modprobe -r "$mname"
fi
}
module_deny_fix() {
local mname="$1"
if ! modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$mpname\b"; then
echo "Module $mname isn't blacklist listed. Denylisting."
echo "blacklist $mname" >> /etc/modprobe.d/"$mpname".conf
fi
}
for mdir in $mpath; do
if [ -d "$mdir/$mndir" ] && [ -n "$(ls -A $mdir/$mndir)" ]; then
echo "Module $mname exists in $mdir. Checking if disabled..."
module_deny_fix $mname
if [ "$mdir" = "/lib/modules/$(uname -r)/kernel/$mtype" ]; then
module_loadable_fix $mname
module_loaded_fix $mname
fi
else
echo "Module $mname doesn't exist in $mdir."
fi
done
echo "Remediation of module $mname complete."
}
hfs_kernel_module_remediation "$@"