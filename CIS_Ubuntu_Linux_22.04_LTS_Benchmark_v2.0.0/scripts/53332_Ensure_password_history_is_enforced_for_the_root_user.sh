sed -i 's/requisite\ pam_pwhistory\.so/ requisite   pam_pwhistory.so remember=24 enforce_for_root try_first_pass use_authtok/' /etc/pam.d/*
pam-auth-update --enable pwhistory