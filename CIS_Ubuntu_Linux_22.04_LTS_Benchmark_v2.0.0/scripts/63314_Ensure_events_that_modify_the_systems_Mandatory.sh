printf "%s" \
"-w /etc/apparmor/ -p wa -k MAC-policy" \
"-w /etc/apparmor.d/ -p wa -k MAC-policy" |
>> /etc/audit/rules.d/50-MAC-policy.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi