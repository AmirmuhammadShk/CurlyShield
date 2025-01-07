echo "w /var/log/lastlog -p wa -k logins" >> /etc/audit/rules.d/50-login.rules
echo "w /var/run/faillock -p wa -k logins" >> /etc/audit/rules.d/50-login.rules
augenrules --load
if auditctl -s | grep "enabled" | grep 2; then
echo "Reboot required to load rules"
fi