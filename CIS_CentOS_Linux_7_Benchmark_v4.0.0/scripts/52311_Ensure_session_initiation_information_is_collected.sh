echo "w /var/run/utmp -p wa -k session" >> /etc/audit/rules.d/50-session.rules
echo "w /var/log/wtmp -p wa -k session" >> /etc/audit/rules.d/50-session.rules
echo "w /var/log/btmp -p wa -k session" >> /etc/audit/rules.d/50-session.rules
augenrules --load
if auditctl -s | grep "enabled" | awk '{print $2}'; then
echo "Reboot required to load rules"
fi