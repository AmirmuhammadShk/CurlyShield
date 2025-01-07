printf '%s\n' "-e 2" > /etc/audit/rules.d/99-finalize.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi