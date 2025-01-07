Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with
the relevant rules to monitor successful and unsuccessful attempts to use the chacl
command.
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
# Add rule for permitted actions on chacl
auditctl -a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k perm_chng >> /etc/audit/rules.d/50-perm_chng.rules
# Add rule for denied actions on chacl
auditctl -a always,exit -F path=/usr/bin/chacl -F perm=-x -F auid>=${UID_MIN} -F auid!=unset -k perm_rej >> /etc/audit/rules.d/50-perm_rej.rules
else
echo "ERROR: Variable 'UID_MIN' is unset."
fi
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi