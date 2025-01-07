cat /etc/systemd/journald.conf | grep -i rotate
if [ $(grep -c "SystemMaxUse" /etc/systemd/journald.conf) -gt 0 ]; then
echo "Rotation settings found"
else
echo "No rotation settings found, proceed with default configuration"
fi
echo "Edge cases and prioritisation of parameters:"
if grep -q "SystemMaxUse" /etc/systemd/journald.conf; then
echo "SystemMaxUse set"
elif grep -q "RuntimeMaxUse" /etc/systemd/journald.conf; then
echo "RuntimeMaxUse set"
else
echo "No max use parameter set, using default configuration"
fi
echo "Rotation parameters:"
if grep -q "SystemKeepFree=" /etc/systemd/journald.conf; then
echo "SystemKeepFree set"
elif grep -q "RuntimeKeepFree=" /etc/systemd/journald.conf; then
echo "RuntimeKeepFree set"
else
echo "No keep free parameter set, using default configuration"
fi
echo "Log retention time:"
if grep -q "MaxFileSec=" /etc/systemd/journald.conf; then
echo "Logs retained for $((10#${MaxFileSec}))"
else
echo "Default log retention time applied"
fi