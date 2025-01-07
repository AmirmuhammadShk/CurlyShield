awk -F: '($1!~/^(root|halt|sync|shutdown|nfsnobody)$/ && ($3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' || $3 == 65534)) { print $1 }' /etc/passwd | while read user; do
usermod -s nologin $user >/dev/null 2>&1
done
awk '/nologin/ {print $1}' /etc/passwd | while read user; do
usermod -L $user >/dev/null 2>&1
done