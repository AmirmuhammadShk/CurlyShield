if ! augenrules --load; then
echo "Error loading AugenRules"
exit 1
fi
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
# Perform a reboot
systemctl reboot || {
echo "Failed to perform reboot"
exit 1
}
else
echo "Rules loaded successfully"
fi