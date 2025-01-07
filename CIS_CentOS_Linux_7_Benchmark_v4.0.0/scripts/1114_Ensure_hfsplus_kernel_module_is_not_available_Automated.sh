mname="hfsplus"
mtype="fs"
mpath="/lib/modules/**/kernel/$mtype"
module_loadable_fix() {
# Check if the module is loadable
modprobe -n -v "$mname" | grep -Pq "(^\h*install|$mname)\b"
if [ $? -ne 0 ]; then
echo "install $mname /bin/false" >> /etc/modprobe.d/"$mname".conf
fi
}
module_loaded_fix() {
# Check if the module is loaded
lsmod | grep "$mname" > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "unloading module $mname"
modprobe -r "$mname"
fi
}
module_deny_fix() {
# Check if the module is deny listed
modprobe --showconfig | grep -Pq "^\h*blacklist$ mname\b"
if [ $? -ne 0 ]; then
echo "deny listing $mname"
echo "blacklist $mname" >> /etc/modprobe.d/"$mname".conf
fi
}
for dir in "$mpath"; do
if [ -d "$dir/$mndir" ] && [ -n "$(ls -A "$dir/$mndir")" ]; then
echo "module: \"$mname\" exists in \"$dir\"\n"
module_deny_fix
if [ "$dir" = "/lib/modules/$(uname -r)/kernel/$mtype" ]; then
module_loadable_fix
module_loaded_fix
fi
else
echo "module: \"$mname\" doesn't exist in \"$dir\"\n"
fi
done
echo "remediation of module: \"$mname\" complete\n"