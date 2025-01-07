sed -i 's/PASS_MIN_DAYS 0/PASS_MIN_DAYS 1/' /etc/login.defs
chage --mindays 1 <user>