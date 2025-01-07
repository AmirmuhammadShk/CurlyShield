echo "Updating /etc/login.defs to ensure minimum password days"
sed -i 's/^\(PASS_MIN_DAYS\).*$/ PASS_MIN_DAYS 1/' /etc/login.defs
echo "Modifying user parameters"
awk -F: '($2~/^\$.+\$/) {system("chage --mindays 1 $1")}' /etc/shadow