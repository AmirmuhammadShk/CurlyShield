sed -i 's/pam_unix.so/pam_unix.so sha512/' /etc/pam.d/password-auth
sed -i 's/pam_unix.so/pam_unix.so sha512/' /etc/pam.d/system-auth