if lsmod | grep "wireless" > /dev/null 2>&1; then
for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do
l_mname=$(basename "$(readlink -f "$driverdir"/device/driver/module)")
module_fix "$l_mname"
done
fi
module_fix() {
local l_mname=$1
if ! modprobe -n -v "$l_mname" | grep -P -- '^\h*install \\/bin\/(true|false)'; then
echo -e "  - setting module: \"$l_mname\" to be un-loadable"
echo -e "install $l_mname /bin/false" >> /etc/modprobe.d/"$l_mname".conf
fi
if lsmod | grep "$l_mname" > /dev/null 2>&1; then
echo -e "  - unloading module \"$l_mname\""
modprobe -r "$l_mname"
fi
if ! grep -Pq -- "^\h*blacklist\h+$l_mname\b" /etc/modprobe.d/*; then
echo -e "  - deny listing \"$l_mname\""
echo -e "blacklist $l_mname" >> /etc/modprobe.d/"$l_mname".conf
fi
}