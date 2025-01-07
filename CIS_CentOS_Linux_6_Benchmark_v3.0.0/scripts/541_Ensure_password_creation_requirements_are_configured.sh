sudo sed -i 's/pam_cracklib.so.*//g' /etc/pam.d/password-auth
echo "password requisite pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1" | sudo tee /etc/pam.d/password-auth
sudo sed -i 's/pam_cracklib.so.*//g' /etc/pam.d/system-auth
echo "password requisite pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1" | sudo tee /etc/pam.d/system-auth