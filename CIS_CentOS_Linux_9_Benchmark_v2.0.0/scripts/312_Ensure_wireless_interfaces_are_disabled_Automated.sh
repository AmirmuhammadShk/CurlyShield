set -e
set -u
l_mname=$1
module_fix() {
if ! modprobe -n -v "$l_mname" | grep -P -- '^\h*install /bin/true'; then
echo "Setting module: \"$l_mname\" to be un-loadable"
echo "install $l_mname /bin/false" >> /etc/modprobe.d/"$l_mname".conf
fi
if lsmod | grep "$l_mname" > /dev/null; then
echo "Unloading module \"$l_mname"`
modprobe -r "$l_mname"
fi
if ! grep -Pq -- "^\h*blacklist\b $l_mname\b" /etc/modprobe.d/*; then
echo "Deny listing \"$l_mname\""
echo "blacklist $l_mname" >> /etc/modprobe.d/"$l_mname".conf
fi
}
if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
l_dname=$(for driverdir in $(find /sys/class/net/*/ -type d -name
wireless | xargs -0 dirname); do basename "$(readlink -f
"$driverdir"/device/driver/module)";done | sort -u)
for l_mname in $l_dname; do
module_fix "$l_mname"
done
fi