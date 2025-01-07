grep -P -- '\bpam_pwhistory\.so\b' /usr/share/pam-configs/* | grep "requisite"
pam-auth-update --enable pwhistory