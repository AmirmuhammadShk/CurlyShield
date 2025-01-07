printf "%s -p wa -k logins" >&8 /var/log/lastlog
printf "%s -p wa -k logins" >&8 /var/run/faillock
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi