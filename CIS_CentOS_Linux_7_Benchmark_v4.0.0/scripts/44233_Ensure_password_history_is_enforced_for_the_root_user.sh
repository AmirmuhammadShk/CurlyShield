Edit /etc/pam.d/system-auth and /etc/pam.d/password-auth to add or modify 'password' lines as needed:
password    requisite     pam_pwquality.so try_first_pass local_users_only retry=3
password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok
password    required      pam_pwhistory.so remember=24 enforce_for_root try_first_pass use_authtok
password    required      pam_deny.so
Note: The 'use_authtok' option should exist on all password lines except the first entry and the pam_deny.so line.