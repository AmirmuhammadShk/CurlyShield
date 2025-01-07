for driverdir in $(find /sys/class/net/*/ -type d -name wireless); do
l_mname=$(basename "$(readlink -f "$driverdir"/device/driver/module)")
module_fix
done
module_fix() {
if ! modprobe -n -v "$1" | grep -P -- '^\h*install
\/bin\/(true|false)'; then
echo -e " - setting module: \"$1\" to be un-loadable"
echo -e "install $1 /bin/false" >> /etc/modprobe.d/"$1".conf
fi
if lsmod | grep "$1" > /dev/null 2>&1; then
echo -e " - unloading module \"$1\""
modprobe -r "$1"
fi
if ! grep -Pq -- "^\h*blacklist\h+$1\b" /etc/modprobe.d/*; then
echo -e " - deny listing \"$1\""
echo -e "blacklist $1" >> /etc/modprobe.d/"$1".conf
fi
}