echo "printf \"-w /etc/sudoers -p wa -k scope\" >> /etc/audit/rules.d/50-scope.rules"
echo "printf \"-w /etc/sudoers.d -p wa -k scope\" >> /etc/audit/rules.d/50-scope.rules"
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi