while read user; do
usermod -s $(which nologin) $user
done < /etc/passwd | grep -v "root|sync|shutdown|halt"
while IFS= read -r user; do
usermod -L $user
done < /etc/passwd | grep -v "root" | while read user; do
if [ $(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs) -gt 500 ]; then
usermod -L $user
fi
done
while IFS= read -r user; do
if [ $(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs) -gt 500 ]; then
usermod -L $user
fi
done < /etc/passwd | grep -v "root"