apt install libpam-pwquality
sed -i '/minlen/ s/$/ 14/' /etc/security/pwquality.conf
sed -i '/minclass/ s/$/ 4/' /etc/security/pwquality.conf
sed -i '/dcredit/ s/$/ -1/' /etc/security/pwquality.conf
sed -i '/ucredit/ s/$/ -1/' /etc/security/pwquality.conf
sed -i '/ocredit/ s/$/ -1/' /etc/security/pwquality.conf
sed -i '/lcredit/ s/$/ -1/' /etc/security/pwquality.conf
echo "password requisite pam_pwquality.so retry=3" >> /etc/pam.d/common-password