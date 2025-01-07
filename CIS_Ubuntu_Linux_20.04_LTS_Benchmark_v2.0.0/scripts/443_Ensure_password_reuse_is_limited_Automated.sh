echo "password required pam_pwhistory.so remember=5" >> /etc/pam.d/common-password
sed -i 's/obscure/sha512/g' /etc/pam.d/common-password
sed -i 's/default=ignore/use_authtok/g' /etc/pam.d/common-password