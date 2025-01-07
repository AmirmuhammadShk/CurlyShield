l_output=""
l_output2=""
l_valid_shells="^($(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed
-rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|' - ))$"
a_users=()
a_ulock=()
while read -r l_user; do
echo -e " - System account \"$l_user\" has a valid logon shell, changing shell to \"$(which nologin)\""
usermod -s "$(which nologin)" "$l_user"
done < <(awk -v pat="$l_valid_shells" -F: '($1!~/(root|sync|shutdown|halt|^\+)/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $(NF) ~ pat) { print $1 }' /etc/passwd)
while read -r l_ulock; do
echo -e " - System account \"$l_ulock\" is not locked, locking account"
usermod -L "$l_ulock"
done < <(awk -v pat="$l_valid_shells" -F: '($1!~/(root|^\+)/ && $2!~/LK?/
&& $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $(NF) ~ pat) { print $1 }' /etc/passwd)
# Lock non-root accounts
for ulock in $(cat /etc/passwd | awk -v pat="$l_valid_shells" -F: '($1!~/(root|^\+)/
&& $2!~/LK?/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $(NF) ~ pat) { print $1 }' | sort)
do
usermod -L "$ulock"
done