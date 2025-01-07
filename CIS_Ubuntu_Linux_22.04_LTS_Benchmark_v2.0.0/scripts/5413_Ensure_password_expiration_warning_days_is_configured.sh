sed -i '/^PASS_WARN_AGE$/s/.*// PASS_WARN_AGE 7' /etc/login.defs
awk -F: '($2~/^\$.+\$/) {if($6 < 7) chage --warndays 7 $1}' /etc/shadow