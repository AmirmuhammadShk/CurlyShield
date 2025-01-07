echo "Setting PASS_MAX_DAYS parameter to conform to site policy in /etc/login.defs"
sed -i 's/^\(PASS_MAX_DAYS\)\s*=\s*[0-9]\+\s*/\1 365/' /etc/login.defs
echo "Modifying user parameters for all users with a password set"
awk -F: '($2~/^\$.+\$/) {if($5 > 365 || $5 < 1)system ("chage --maxdays 365 $1")}' /etc/shadow
echo "Setting default value for PASS_MAX_DAYS in /etc/login.defs"
sed -i 's/^\(PASS_MAX_DAYS\)\s*=\s*[0-9]\+\s*/\1 99999/' /etc/login.defs