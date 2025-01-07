sed -i 's/^PASS_MIN_DAYS=.*/PASS_MIN_DAYS 1/' /etc/login.defs
chage --mindays 1 $(getent passwd | cut -d: -f1)