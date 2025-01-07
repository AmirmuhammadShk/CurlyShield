L_MNAME="cramfs"
L_MTYPE="fs"
L_MPATH="/lib/modules/**/kernel/$L_MTYPE"
L_MPNAME=$(tr '-' '_' <<< "$L_MNAME")
if modprobe -n -v "$L_MNAME" &> /dev/null; then
# If the module is loadable, add "install $L_MNAME /bin/false" to a file in /etc/modprobe.d/
echo "install $L_MNAME /bin/false" >> /etc/modprobe.d/"$L_MPNAME".conf
fi
for L_MDIR in $L_MPATH; do
if [ -d "$L_MDIR/$L_MNDIR" ] && [ -n "$(ls -A $L_MDIR/$L_MNDIR)" ]; then
# If the module is present, check if it's disabled
echo "Module: $L_MNAME exists in $L_MDIR"
echo "Deny listing $L_MNAME"
echo "blacklist $L_MNAME" >> /etc/modprobe.d/"$L_MPNAME".conf
# If the module is in the default kernel path, unload it
if [ "$L_MDIR" = "/lib/modules/$(uname -r)/kernel/$L_MTYPE" ]; then
echo "Unloading module $L_MNAME"
modprobe -r "$L_MNAME"
fi
else
echo "Module: $L_MNAME doesn't exist in $L_MDIR"
fi
done
echo "Remediation of module $L_MNAME complete"