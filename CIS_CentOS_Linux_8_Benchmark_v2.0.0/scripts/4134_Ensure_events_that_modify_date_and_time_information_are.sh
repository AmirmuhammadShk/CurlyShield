Create audit rules
Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with
the relevant rules to monitor events that modify date and time information.
64 Bit systems
Example:
-a always,exit -F arch=b64 -S adjtimex=settimeofday,clock_settime -k time-change
-a always,exit -F arch=b32 -S adjtimex,settimeofday,clock_settime -k time-change
-w /etc/localtime -p wa -k time-change
Load audit rules
augenrules --load
Check if reboot is required
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi