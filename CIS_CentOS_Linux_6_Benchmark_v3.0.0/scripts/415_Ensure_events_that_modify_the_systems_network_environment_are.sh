echo "Add the following lines to /etc/audit/rules.d/10-system_local.rules for 32 bit systems:"
echo "  -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale"
echo "  -w /etc/issue -p wa -k system-locale"
echo "  -w /etc/issue.net -p wa -k system-locale"
echo "  -w /etc/hosts -p wa -k system-locale"
echo "  -w /etc/sysconfig/network -p wa -k system-locale"
echo "Add the following lines to /etc/audit/rules.d/10-system_local.rules for 64 bit systems:"
echo "  -a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale"
echo "  -a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale"
echo "  -w /etc/issue -p wa -k system-locale"
echo "  -w /etc/issue.net -p wa -k system-locale"
echo "  -w /etc/hosts -p wa -k system-locale"
echo "  -w /etc/sysconfig/network -p wa -k system-locale"