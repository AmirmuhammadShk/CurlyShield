if [ ! -f "/etc/audit/rules.d/50-login.rules" ]; then
echo "w /var/log/lastlog -p wa -k logins"
echo "w /var/run/faillock -p wa -k logins" >> /etc/audit/rules.d/50-login.rules
fi
augenrules --load
if [ "$(auditctl -s | grep enabled | awk '{print $1}' | cut -d ' ' -f 2-)" = "2" ]; then
echo "Reboot required to load rules"
else
echo ""
fi