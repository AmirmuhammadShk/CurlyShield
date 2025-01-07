for interface in $(ip link show | awk '{print $2}'); do
ip link set "$interface" down
done
echo "Disabling wireless interfaces to prevent automatic connection."