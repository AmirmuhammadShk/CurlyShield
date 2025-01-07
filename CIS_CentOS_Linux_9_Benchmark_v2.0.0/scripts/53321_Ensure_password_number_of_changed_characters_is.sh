sed -ri 's/^\s*difok\s*=/# &/' /etc/security/pwquality.conf
printf '\n%s' "difok = 2" >> /etc/security/pwquality.conf.d/50-pwdifok.conf
for l_pam_file in system-auth password-auth; do
l_authselect_file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$l_pam_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+difok\s*=\s*\S+)(.*$)/\1\4/' "$l_authselect_file"
done
authselect apply-changes