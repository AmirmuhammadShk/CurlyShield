if [ ! -f /etc/security/pwquality.conf ]; then
echo "Creating default pwquality.conf"
printf '\n%s' "minclass = 4" > /etc/security/pwquality.conf.d/50-pwcomplexity.conf
else
sed -ri 's/^\s*minclass\s*=/# &/' /etc/security/pwquality.conf
sed -ri 's/^\s*[dulo]credit\s*=/# &/' /etc/security/pwquality.conf
fi
if [ ! -f /etc/security/pwquality.conf.d/50-pwcomplexity.conf ]; then
echo "Creating default pwcomplexity.conf"
printf '\n%s' "dcredit = -1" "ucredit = -1" "ocredit = -1" "lcredit = -1" > /etc/security/pwquality.conf.d/50-pwcomplexity.conf
else
sed -ri 's/^\s*minclass\s*=/# &/' /etc/security/pwquality.conf.d/50-pwcomplexity.conf
fi
for l_pam_file in system-auth password-auth; do
authselect_file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$l_pam_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+minclass\s*=\s*\S+)(.*)/\1\4/' "$authselect_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+dcredit\s*=\s*\S+)(.*)/\1\4/' "$authselect_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam	pwquality\.so.*)(\s+ucredit\s*=\s*\S+)(.*)/\1\4/' "$authselect_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+lcredit\s*=\s*\S+)(.*)/\1\4/' "$authselect_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+ocredit\s*=\s*\S+)(.*)/\1\4/' "$authselect_file"
done
authselect apply-changes