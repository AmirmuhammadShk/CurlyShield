augenrules --load || { echo "Rules not aligned, reloading"; }
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi