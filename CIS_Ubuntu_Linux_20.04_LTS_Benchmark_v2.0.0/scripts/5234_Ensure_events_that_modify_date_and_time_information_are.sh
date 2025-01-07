augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi
printf "
-a always,exit -F arch=b64 -S adjtimex,settimeofday,clock_settime -k time-
change
-a always,exit -F arch=b32 -S adjtimex,settimeofday,clock_settime -k time-
change
-w /etc/localtime -p wa -k time-change
" >> /etc/audit/rules.d/50-time-change.rules
printf "
-a always,exit -F arch=b32 -S adjtimex,settimeofday,clock_settime,stime -k time-
change
" >> /etc/audit/rules.d/50-time-change.rules