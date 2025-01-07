echo "maxsequence = 3" | tee -a /etc/security/pwquality.conf
for file in system-auth password-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+maxsequence\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$file"
done