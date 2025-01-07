printf "%s\n-w /etc/selinux -p wa -k MAC-policy" >> /etc/audit/rules.d/50-MAC-policy.rules
printf "\n-w /usr/share/selinux -p wa -k MAC-policy" >> /etc/audit/rules.d/50-MAC-policy.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi