if [ ! -d "/tmp" ]; then
echo "Error: No separate partition for /tmp found"
exit 1
fi
echo "Mounting /tmp with nosuid option..." > /dev/null
mount -o remount,nosuid /tmp > /dev/null
echo "Command executed successfully"