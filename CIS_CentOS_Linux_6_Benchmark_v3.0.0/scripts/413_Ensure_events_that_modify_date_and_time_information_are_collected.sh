echo "echo \"Edit or create a file in the /etc/audit/rules.d/ directory ending in .rules\"" >> $BASH_SOURCE
echo "echo \"Example: vi /etc/audit/rules.d/10-time_change.rules\"" >> $BASH_SOURCE
echo "echo \"Add the following lines:\" >> $BASH_SOURCE
echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-\"" >> $BASH_SOURCE
echo "-a always,exit -F arch=b32 -S clock_settime -k time-change\"" >> $BASH_SOURCE
echo "-w /etc/localtime -p wa -k time-change\"" >> $BASH_SOURCE
echo "echo \"Edit or create a file in the /etc/audit/rules.d/ directory ending in .rules\"" >> $BASH_SOURCE
echo "echo \"Example: vi /etc/audit/rules.d/10-time_change.rules\"" >> $BASH_SOURCE
echo "echo \"Add the following lines:\\" >> $BASH_SOURCE
echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> $BASH_SOURCE
echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-\" >> $BASH_SOURCE
echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >> $BASH_SOURCE
echo "-a always,exit -F arch=b32 -S clock_settime -k time-change\"" >> $BASH_SOURCE
echo "-w /etc/localtime -p wa -k time-change\"" >> $BASH_SOURCE