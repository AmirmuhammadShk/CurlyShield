sed -ri 's/^\s*difok\s*=/\# &/' /etc/security/pwquality.conf
printf '\n%s' "difok = 2" >> /etc/security/pwquality.conf
for l_pam_file in system-auth password-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+difok\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$l_pam_file"
done