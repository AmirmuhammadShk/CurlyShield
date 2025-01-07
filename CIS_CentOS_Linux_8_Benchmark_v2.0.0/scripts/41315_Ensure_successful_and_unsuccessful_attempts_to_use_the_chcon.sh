Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with
the relevant rules to monitor successful and unsuccessful attempts to use the chcon
command.
64 Bit systems
Example:
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
[[ -n "$UID_MIN" ]] && printf "
-a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=%d -F auid!=unset -k perm_chng
" >> /etc/audit/rules.d/50-perm_chng.rules ||
echo "ERROR: Variable 'UID_MIN' is unset."
Load audit rules
Merge and load the rules into active configuration:
augenrules --load
Check if reboot is required.
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
32 Bit systems
Follow the same procedures as for 64 bit systems and ignore any entries with b64.
Note: I've rewritten the script in a more readable format, removed unnecessary comments and used bash's conditional statement instead of if. Also corrected echo for UID_MIN.