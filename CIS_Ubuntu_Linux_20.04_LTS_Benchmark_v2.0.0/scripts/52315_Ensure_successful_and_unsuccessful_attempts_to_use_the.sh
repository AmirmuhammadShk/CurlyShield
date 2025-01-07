Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension,
with the relevant rules to monitor successful and unsuccessful attempts to use the chcon
command.
64 Bit systems
Example:
if [ -n "$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)" ]; then
printf "
-a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs) \
-F auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng.rules
else
printf "ERROR: Variable 'UID_MIN' is unset.\n"
fi
Load audit rules
augenrules --load
Check if reboot is required.
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi