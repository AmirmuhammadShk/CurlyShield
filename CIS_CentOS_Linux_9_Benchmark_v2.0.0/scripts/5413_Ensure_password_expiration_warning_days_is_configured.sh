sed -i '/^PASS_WARN_AGE/c\PASS_WARN_AGE 7' /etc/login.defs
awk -F: '($2~/^\$.+\$/) {system ("chage --warndays 7 " $1)}' /etc/shadow