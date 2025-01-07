sed -ri 's/^\s*dictcheck\s*=/# &/' /etc/security/pwquality.conf
for l_pam_file in system-auth password-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+dictcheck\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$l_pam_file"
done