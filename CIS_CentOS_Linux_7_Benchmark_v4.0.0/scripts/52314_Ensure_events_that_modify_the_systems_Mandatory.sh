auditctl -D /etc/audit/rules.d/50-MAC-policy.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load new rules\n"
fi