{
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=chown -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=chgrp -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=chgl -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=chown -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=chgrp -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
[ -n "${UID_MIN}" ] && printf " -a always,exit -F path=/usr/bin/chcon -F perm=chgl -F auid>=${UID_MIN} -F auid!=unset -k perm_chng\n" >> /etc/audit/rules.d/50-perm_chng.rules
}
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then printf "Reboot required to load rules\n"; fi