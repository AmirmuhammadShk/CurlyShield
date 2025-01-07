sed -i '/^password /s/requisite/pam_pwquality.so try_first_pass local_users_only \nretry=3 ' /etc/pam.d/system-auth
sed -i '/^password /s/requisite/pam_pwquality.so try_first_pass local_users_only \nretry=3 ' /etc/pam.d/password-auth
sed -i '/^password /s/$/   required      pam_pwhistory.so remember=24 enforce_for_root  try_first_pass use_authtok/' /etc/pam.d/system-auth
sed -i '/^password /s/$/   required      pam_pwhistory.so remember=24 enforce_for_root  try_first_pass use_authtok/' /etc/pam.d/password-auth
sed -i '/^password / s/ \n/d' /etc/pam.d/system-auth
sed -i '/^password / s/ \n/d' /etc/pam.d/password-auth