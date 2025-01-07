auditctl -a -v always,exit \
-F arch=b32 -S sethostname=setdomainname -k system-locale \
-w /etc/issue -p wa -k system-locale \
-w /etc/issue.net -p wa -k system-locale \
-w /etc/hosts -p wa -k system-locale \
-w /etc/networks -p wa -k system-locale \
-w /etc/network/ -p wa -k system-locale
augenrules --load
if [[ $(auditctl -s | grep "enabled") =~ "2" ]]; then
printf "Reboot required to load rules\n"
fi