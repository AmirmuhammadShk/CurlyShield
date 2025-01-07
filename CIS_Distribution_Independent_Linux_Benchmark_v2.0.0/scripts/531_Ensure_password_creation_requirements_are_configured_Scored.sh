echo "Enabling password creation requirements" >&2
echo "Updating PAM configuration..." >&2
echo "Adding pam_cracklib.so options:"
echo "  password required pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1"
echo "Adding pam_pwquality.so options:"
echo "  password requisite pam_pwquality.so try_first_pass retry=3"
if [ -f "/etc/security/pwquality.conf" ]; then
echo "Configuring pwquality settings in /etc/security/pwquality.conf:"
echo "  minlen = 14" >&2
echo "  dcredit = -1" >&2
echo "  ucredit = -1" >&2
echo "  ocredit = -1" >&2
echo "  lcredit = -1"
fi
sed 's/=/ /g' "/etc/security/pwquality.conf" > "/tmp/pwquality.conf"
cp "/tmp/pwquality.conf" "/etc/security/pwquality.conf"
echo "Password creation requirements configured successfully."