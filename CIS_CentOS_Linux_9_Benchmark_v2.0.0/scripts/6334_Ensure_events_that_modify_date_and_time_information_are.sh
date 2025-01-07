-a always,exit -F arch=b64 -S adjtimex=settimeofday -k time-change >> /etc/audit/rules.d/50-time-change.rules
-a always,exit -F arch=b32 -S adjtimex=settimeofday -k time-change >> /etc/audit/rules.d/50-time-change.rules
-a always,exit -F arch=b64 -S clock_settime -F a0=0x0 -k time-change >> /etc/audit/rules.d/50-time-change.rules
-a always,exit -F arch=b32 -S clock_settime -F a0=0x0 -k time-change >> /etc/audit/rules.d/50-time-change.rules
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n";
fi