printf "%s\n" -w /var/run/utmp -p wa -k session -w /var/log/wtmp -p wa -k session -w /var/log/btmp -p wa -k session >> /etc/audit/rules.d/50-session.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi