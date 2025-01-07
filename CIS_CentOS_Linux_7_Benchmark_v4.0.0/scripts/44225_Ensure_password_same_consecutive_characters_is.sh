maxrepeat to 3 or less
sed -ri 's/maxrepeat\s*=\s*\([0-9]\+\)\s*/maxrepeat = $1/' /etc/security/pwquality.conf
in the PAM files:
for l_pam_file in system-auth password-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+maxrepeat\s*=\s*\S+)(.*$)/\1\4/' /etc/pam.d/"$l_pam_file"
done