if command -v nmcli >/dev/null 2>&1; then
nmcli radio all off
else
for driverdir in $(find /sys/class/net/*/ -type d -name wireless | xargs -0 dirname); do
dm=$(basename "$(readlink -f "$driverdir"/device/driver/module)")
echo "install $dm /bin/true" >> /etc/modprobe.d/disable_wireless.conf
done
fi