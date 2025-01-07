sed -i 's/^\(PASS_WARN_AGE\).*$/\1 7/' /etc/login.defs
chage --warndays 7 $(getent passwd | grep -v "^#.*" | cut -d: -f1)