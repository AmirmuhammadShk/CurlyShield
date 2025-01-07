UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)
users_to_change=$(awk -F: -v UID_MIN="${UID_MIN}" '( $3 >= UID_MIN && $1 != "nfsnobody" ) { print $1 }' /etc/passwd)
echo "Changing passwords for the following users"
xargs -I {} echo "{}: 0" | chage -d 0