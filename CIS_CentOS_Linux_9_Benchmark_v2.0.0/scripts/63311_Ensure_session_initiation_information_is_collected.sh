echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor session initiation information." >&2
echo "Example:" >&2
printf "%q
-w /var/run/utmp -p wa -k session
-w /var/log/wtmp -p wa -k session
-w /var/log/btmp -p wa -k session
" >> /etc/audit/rules.d/50-session.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
echo "Reboot required to load rules"
fi