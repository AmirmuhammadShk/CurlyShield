crypt_style = sha512
echo "crypt_style = sha512" | sudo tee -a /etc/libuser.conf
echo "ENCRYPT_METHOD SHA512" | sudo tee -a /etc/login.defs
echo "
auth    required    pam_unix.so nullok_secure
auth    include     password-auth
" | sudo tee -a /etc/pam.d/password-auth
echo "
auth    required    pam_unix.so nullok_secure
auth    include     system-auth
" | sudo tee -a /etc/pam.d/system-auth