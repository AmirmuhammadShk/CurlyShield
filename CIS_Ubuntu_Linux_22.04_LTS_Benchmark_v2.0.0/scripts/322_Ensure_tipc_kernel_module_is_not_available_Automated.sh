mname="tipc"
mtype="net"
for dir in /lib/modules/**/kernel/$mtype; do
if [ -d "$dir" ]; then
# Create blacklist file if it doesn't exist
blacklist_file="/etc/modprobe.d/${mname}.conf"
if ! test -f "$blacklist_file"; then
touch "$blacklist_file"
fi
# Blacklist the module
echo "blacklist $mname" >> "$blacklist_file"
# Unload the module if it's loaded
if lsmod | grep "$mname" > /dev/null 2>&1; then
modprobe -r "$mname"
fi
break
fi
done
echo "Remediation of module: $mname complete"
echo "Blacklist $mname" >> /etc/modprobe.d/blacklist.conf