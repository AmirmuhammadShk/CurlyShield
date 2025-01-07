valid_user_ids=($(awk -F: '/^\s*UID_MIN/{print $2}' /etc/login.defs))
for user in $(grep ^user /etc/passwd); do
if [ $user ]; then
UID=$(cut -d: -f3 <<< "$user")
if [ $UID -lt ${valid_user_ids[0]} ] || [ $UID -eq 65534 ]; then
awk -v pat="^$(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|' - )" '
($1!~/^(root|halt|sync|shutdown|nfsnobody)$/ && $3 ~ pat) {
usermod -s nologin "$user"
}
' /etc/passwd
fi
fi
done