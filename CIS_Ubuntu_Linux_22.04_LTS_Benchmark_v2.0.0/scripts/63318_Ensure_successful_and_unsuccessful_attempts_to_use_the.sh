UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
printf "# Monitor successful and unsuccessful attempts to use the usermod command\n"
printf "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=%s -F auid!=unset -k usermod\n" "$UID_MIN" >> /etc/audit/rules.d/50-usermod.rules
else
printf "ERROR: Variable 'UID_MIN' is unset.\n"
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi