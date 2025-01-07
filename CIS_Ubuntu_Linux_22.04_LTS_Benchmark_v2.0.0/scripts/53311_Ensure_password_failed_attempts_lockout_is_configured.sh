echo "deny=5" > /etc/security/faillock.conf
grep -Pl -- '\bpam_faillock\.so\h+([^#\n\r]+\h+)?deny\b' /usr/share/pam-configs/* | sed '/^deny/ s/deny=3/deny=5/'