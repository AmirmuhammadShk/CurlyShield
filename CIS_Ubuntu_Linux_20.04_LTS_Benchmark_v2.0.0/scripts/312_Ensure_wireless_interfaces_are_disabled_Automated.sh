if [ -n "$(find /sys/class/net/*/ -type d -name wireless)" ]; then
blacklisted_modules=($(for driverdir in $(find /sys/class/net/*/ -type d -name "wireless" | xargs -0 dirname); do
module=$(readlink -f "$driverdir"/device/driver/module)
echo "$module"
done | sort -u))
for module in "${blacklisted_modules[@]}"; do
modprobe -n -v "$module" | grep -P -- '^\h*install /bin/(true|false)' || {
echo "setting module: \"$module\" to be un-loadable"
echo "install $module /bin/false" >> /etc/modprobe.d/"$module".conf
}
if lsmod | grep "$module" > /dev/null 2>&1; then
modprobe -r "$module"
echo "unloading module \"$module\""
fi
! grep -Pq -- "^\h*blacklist\h+$module\b" /etc/modprobe.d/* || {
echo "deny listing \"$module\""
echo "blacklist $module" >> /etc/modprobe.d/"$module".conf
}
done
fi