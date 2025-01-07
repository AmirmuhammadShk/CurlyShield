echo "remember = 24" >> /etc/security/pwhistory.conf
for l_pam_file in system-auth password-auth; do
authselect_file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$l_pam_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwhistory\.so.*)(\s+remember\s*=\s*\S+)(.*)/\1\4/' "$authselect_file"
done
authselect apply-changes