sed -i '/password/s/requisite/pam_pwquality.so try_first_pass local_users_only/' /etc/pam.d/system-auth
sed -i '/^$/d' /etc/pam.d/system-auth # delete empty lines after insertion
sed -i '/password/s/requisite/pam_pwquality.so try_first_pass local_users_only/' /etc/pam.d/password-auth
echo "password    requisite     pam_pwquality.so try_first_pass local_users_only" >> /etc/pam.d/system-auth
sed -i "/^password/s/retry/retry=3/" /etc/pam.d/system-auth
sed -i '/password/s/(requisite|required)(.*)//g' /etc/pam.d/password-auth