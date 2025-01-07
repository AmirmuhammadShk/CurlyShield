mname="cramfs"
mtype="fs"
mpath="/lib/modules/**/kernel/$mtype"
echo "blacklist $mname" > /etc/modprobe.d/"$mname".conf
if [ -d "$mpath" ]; then
# Check if module exists on the system
for l_mdir in "$mpath"; do
if [ -d "$l_mdir/$mndir" ] && [ -n "$(ls -A $l_mdir/$mndir)" ]; then
# If module is loadable, add "install {MODULE_NAME} /bin/false" to the blacklist file
modprobe -n -v "$mname"
if grep -Pq -- "(^\h*install|\b$mname)\b" <<< "$modprobe -n -v $mname"; then
echo -e "\n - unloading module \"$mname\""
modprobe -r "$mname"
fi
else
# If module doesn't exist, do nothing
fi
done
fi
echo -e "\n - remediation of module: \"$mname\" complete"