l_mname="rds"
l_mtype="net"
l_mpath="/lib/modules/**/kernel/$l_mtype"
for l_mdir in $l_mpath; do
# Check if the module directory exists and is not empty
if [ -d "$l_mdir/$l_mndir" ] && [ -n "$(ls -A $l_mdir/$l_mndir)" ]; then
echo "Module: $l_mname exists in $l_mdir"
# Check if the module needs to be denied listed
if ! modprobe --showconfig | grep -Pq -- "^\h*blacklist\h+$l_mpname\b"; then
echo "Deny listing $l_mname"
echo "blacklist $l_mname" >> /etc/modprobe.d/"$l_mpname".conf
# Check if the module is currently loadable and needs to be made non-loadable
l_loadable=$(modprobe -n -v "$l_mname")
if [ "$(wc -l <<< "$l_loadable")" -gt "1" ]; then
l_loadable=$(grep -P -- "(^\h*install|\b$l_mname)\b" <<< "$l_loadable")
if ! grep -Pq -- '^\h*install /bin/(true|false)' <<< "$l_loadable"; then
echo "Setting module $l_mname to be not loadable"
echo "install $l_mname /bin/false" >> /etc/modprobe.d/"$l_mpname".conf
# Check if the module is currently loaded and needs to be unloaded
if lsmod | grep "$l_mname" > /dev/null 2>&1; then
echo "Unloading module $l_mname"
modprobe -r "$l_mname"
fi
else
echo "Module: $l_mname doesn't exist in $l_mdir"
fi
done
echo "Remediation of module $l_mname complete"