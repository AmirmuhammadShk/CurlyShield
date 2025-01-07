sudo sed -i 's/try_first_pass.*$/try_first_pass use_authtok/g' /etc/pam.d/system-auth
sed -i 's/.*requisite .*/password    requisite     try_first_pass use_authtok\n/' /etc/pam.d/password-auth
echo "password    required      pam_pwhistory.so remember=24 enforce_for_root try_first_pass use_authtok" | sudo tee -a /etc/pam.d/system-auth > /dev/null
sudo sed -i "/^$/r password    requisite     try_first_pass use_authtok\n/" /etc/pam.d/system-auth
echo "password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok" | sudo tee -a /etc/pam.d/password-auth > /dev/null
sudo sed -i "/^$/r password    sufficient    pam_unix.so sha512 shadow try_first_pass use_authtok\n/" /etc/pam.d/password-auth
echo "password    required      pam_deny.so" | sudo tee -a /etc/pam.d/password-auth > /dev/null