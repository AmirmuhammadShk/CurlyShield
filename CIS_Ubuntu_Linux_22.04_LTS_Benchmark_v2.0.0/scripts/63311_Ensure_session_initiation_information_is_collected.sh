printf "%s -p wa -k session" "/var/run/utmp" "/var/log/wtmp" "/var/log/btmp"
> /etc/audit/rules.d/50-session.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi