edit_pam_files() {
local file1="/etc/pam.d/password-auth"
local file2="/etc/pam.d/system-auth"
# Edit the /etc/pam.d/password-auth and /etc/pam.d/system-auth files
sed -i 's/pam_unix.so.*$/auth [success=1 default=bad] pam_unix.so authfail audit deny=5 unlock_time=900/' "$file1"
sed -i "s/auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900/auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900/" "$file2"
# Restart the PAM service to apply the changes
systemctl restart pam.service
}
edit_pam_files