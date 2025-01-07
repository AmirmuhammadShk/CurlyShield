#!/bin/bash
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
if [ -n "${UID_MIN}" ]; then
printf "  -a always,exit -F arch=b64 -S chmod,fchmod,fchmodat -F auid>=%s -F auid!=unset -F key=perm_mod\n" "$UID_MIN"
printf "  -a always,exit -F arch=b32 -S chmod,fchmod,fchmodat -F auid>=%s -F auid!=unset -F key=perm_mod\n" "$UID_MIN"
printf "  -a always,exit -F arch=b64 -S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F auid>=%s -F auid!=unset -F key=perm_mod\n" "$UID_MIN"
printf "  -a always,exit -F arch=b32 -S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F auid>=%s -F auid!=unset -F key=perm_mod\n" "$UID_MIN"
else
printf "ERROR: Variable 'UID_MIN' is unset.\n"
fi
auditctl --load /etc/audit/rules.d/50-perm_mod.rules