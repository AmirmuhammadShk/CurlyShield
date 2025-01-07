sed -i 's/^\(PASS_MAX_DAYS\).*$/\1 365/' /etc/login.defs
awk -F: '($2~/^\$.+\$/) {system ("chage --maxdays 365 " $1)}' /etc/shadow
last_changed=$(date +%Y-%m-%d)
if [ "$last_changed" = "" ]; then
chage -d "$last_changed" root
fi