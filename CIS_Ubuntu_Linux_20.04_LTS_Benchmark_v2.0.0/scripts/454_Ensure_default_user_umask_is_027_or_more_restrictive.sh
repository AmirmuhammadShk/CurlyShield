grep -RPi '(^|^[^#]*)\s*umask\s+([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][-6]\b|[0-7][01][0-7]\b|[0-7][0-7][-6]\b|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]+\b|(u=[rwx]{1,3},)?g=[^rx]{1,3}(\,o=[rwx]{0,3})?\b)' /etc/login.defs /etc/profile* /etc/bash.bashrc*
echo "UMASK 027" >> /etc/login.defs
cat <<EOF > /etc/bash.bashrc
umask 027
EOF