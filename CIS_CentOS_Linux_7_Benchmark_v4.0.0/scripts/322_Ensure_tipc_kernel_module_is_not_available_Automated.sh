set -ex
l_mname="tipc"
l_mtype="net"
l_mpath="/lib/modules/**/kernel/$l_mtype"
l_mpname="$(tr '-' '_' <<< "$l_mname")"
l_mndir="$(tr '-' '/' <<< "$l_mname")"
for l_mdir in $l_mpath; do
if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
echo "Module: '$l_mname' exists in '$l_mdir'"
# If module is loaded, unload it
if lsmod | grep "$l_mname" > /dev/null 2>&1; then
modprobe -r "$l_mname"
fi
# Add blacklist to prevent loading
echo "Blacklist $l_mname" >> "/etc/modprobe.d/$l_mpname".conf
break
fi
done
if [ "$(lsmod | grep -c "$l_mname")" -gt 0 ]; then
echo "Module: '$l_mname' is loaded. Disabling..."
# Create file with install tipc /bin/false to prevent loading
echo "install $l_mname /bin/false" >> "/etc/modprobe.d/$l_mpname".conf
# Unload module from kernel
modprobe -r "$l_mname"
fi
if [ "$(lsmod | grep -c "$l_mname")" -eq 0 ]; then
echo "Module: '$l_mname' is not loaded. Blacklisting..."
# Create file with blacklist tipc to prevent loading
echo "blacklist $l_mname" >> "/etc/modprobe.d/$l_mpname".conf
fi