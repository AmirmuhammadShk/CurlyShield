UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
# Create or edit audit rule for usermod successful attempts
printf "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=%s -F auid!=unset -k usermod" "${UID_MIN}" >> /etc/audit/rules.d/50-usermod.rules
else
# Log error if UID_MIN is not set
printf "ERROR: Variable 'UID_MIN' is unset.\n"
fi
augenrules --load
if [ $(auditctl -s | grep "enabled") =~ "2" ]; then
# Print message for reboot requirement
printf "Reboot required to load rules\n"
fi