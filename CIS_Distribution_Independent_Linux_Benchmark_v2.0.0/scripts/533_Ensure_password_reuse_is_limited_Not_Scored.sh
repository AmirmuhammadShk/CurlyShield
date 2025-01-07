if [ -f /etc/pam.d/common-password ]; then
echo "password required pam_pwhistory.so remember=5" >> /etc/pam.d/common-password
else
echo "password sufficient pam_unix.so remember=5" >> /etc/pam.d/common-password
fi