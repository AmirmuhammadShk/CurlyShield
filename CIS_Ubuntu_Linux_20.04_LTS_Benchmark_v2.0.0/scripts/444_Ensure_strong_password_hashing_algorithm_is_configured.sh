echo "password   [success=1 default=ignore]   pam_unix.so obscure sha512 use_authtok" > /etc/pam.d/common-password
sed -i 's/ENCRYPT_METHOD //g' /etc/login.defs
echo "ENCRYPT_METHOD SHA512" >> /etc/login.defs