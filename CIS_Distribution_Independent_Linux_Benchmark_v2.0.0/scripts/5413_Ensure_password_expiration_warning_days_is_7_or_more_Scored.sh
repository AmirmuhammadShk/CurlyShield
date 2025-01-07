sed -i 's/^\(PASS_WARN_AGE\)\s*=\s*\([0-9]*\)/\1 = 7/' /etc/login.defs
for user in $(getent passwd | cut -d: -f1000); do
chage --warndays 7 "$user"
done