auditctl -l | grep "login" || { echo "* -p wa -k logins"; auditctl -a -l /etc/audit/rules.d/50-login.rules; }
auditctl -l | grep "logout" || { echo "* -p wa -k logouts"; auditctl -a -l /etc/audit/rules.d/51-logout.rules; }
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi