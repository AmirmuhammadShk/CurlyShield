echo "minclass = 4" >> /etc/security/pwquality.conf
for file in system-auth password-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+minclass\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+dcredit\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+ucredit\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+lcredit\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+ocredit\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$file"
done
minclass=0
dcredit=0
ucredit=0
ocredit=0
lcredit=0