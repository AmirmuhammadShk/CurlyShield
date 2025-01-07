find `/` -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged"}'
echo "Privileged programs audit rule added to /etc/audit/rules.d/10-privileged.rules"
echo >> /etc/audit/rules.d/10-privileged.rules
find `/dev` -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged"}'
echo "Privileged programs audit rule added to /etc/audit/rules.d/11-privileged.rules"
find `/proc` -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged"}'
echo "Privileged programs audit rule added to /etc/audit/rules.d/12-privileged.rules"
find `/sys` -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged"}'
echo "Privileged programs audit rule added to /etc/audit/rules.d/13-privileged.rules"
find `/system` -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print "-a always,exit -F path=" $1 " -F perm=x -F auid>'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' -F auid!=4294967295 -k privileged"}'
echo "Privileged programs audit rule added to /etc/audit/rules.d/14-privileged.rules"