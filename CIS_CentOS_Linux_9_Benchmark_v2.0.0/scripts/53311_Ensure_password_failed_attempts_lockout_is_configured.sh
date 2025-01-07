echo "deny = 5" | tee -a /etc/security/faillock.conf
for l_pam_file in system-auth password-auth; do
l_authselect_file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$l_pam_file"
sed -ri "s/(^\s*auth\s+(requisite|required|sufficient)\s+pam_faillock\.so.*)(\s+deny\s*=\s*\S+)/\1\4/" "$l_authselect_file"
done
authselect apply-changes