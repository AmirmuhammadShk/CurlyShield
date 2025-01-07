sed -i 's/^PASS_WARN_AGE.*$/PASS_WARN_AGE 7/' /etc/login.defs
for user in $(getent passwd | cut -d: -f1); do
chage --warndays 7 $user
done