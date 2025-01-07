sed -i '/pam_pwhistory.so/d' /etc/pam.d/*
echo "   requisite   pam_pwhistory.so remember=24 enforce_for_root try_first_pass use_authtok" >> /etc/pam.d/*
pam-auth-update --enable pwhistory