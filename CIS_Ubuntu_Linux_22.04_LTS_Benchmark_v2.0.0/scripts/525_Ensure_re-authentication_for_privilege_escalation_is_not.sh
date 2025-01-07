sed -i '/^%sudo/a $PAM service auth required pam_reauth.so' /etc/pam.d/*
visudo -f /etc/sudoers
echo "Reauthentication for privilege escalation is now enabled."