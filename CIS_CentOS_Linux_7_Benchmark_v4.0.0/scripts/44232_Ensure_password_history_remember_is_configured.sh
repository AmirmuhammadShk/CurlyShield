echo "password    required      pam_pwhistory.so remember=24 enforce_for_root try_first_pass use_authtok" >> /etc/pam.d/system-auth
echo "password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3" >> /etc/pam.d/system-auth
echo "password    required      pam_pwhistory.so remember=24 enforce_for_root try_first_pass use_authtok" >> /etc/pam.d/password-auth
echo "password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok" >> /etc/pam.d/password-auth
echo "password    required      pam_deny.so" >> /etc/pam.d/password-auth