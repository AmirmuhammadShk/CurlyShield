l_pam_profile=$(head -1 /etc/authselect/authselect.conf)
if grep -Pq -- '^custom/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
grep -P -- 'password\s+pam_unix\.so\s+([^#\n\r]+\s*(sha512|yescrypt)\b)' "$l_pam_profile_path"/{password,system}-auth | while read -r line; do
echo "sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix\.so\s+.*)([^#\n\r]+\s*(md5|bigcrypt|sha256|blowfish)).*/\1\2 sha512/g' $l_pam_profile_path/{password,system}-auth"
done | sed -ri 's/^\s*//'
if ! grep -Pq -- '^custom/' <<< "$l_pam_profile"; then
for l_authselect_file in "$l_pam_profile_path"/password-auth "$l_pam_profile_path"/system-auth; do
if grep -Pq -- 'password\s+pam_unix\.so\s+([^#\n\r]+\s*(sha512|yescrypt)\b)' "$l_authselect_file"; then
echo "A strong password hashing algorithm is correctly set"
elif grep -Pq -- 'password\s+pam_unix\.so\s+[^#\n\r]+\s+(md5|bigcrypt|sha256|blowfish)\b' "$l_authselect_file"; then
echo "A weak password hashing algorithm is set, updating to \"sha512\""
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix\.so\s+.*)([^#\n\r]+\s*(md5|bigcrypt|sha256|blowfish)).*/\1\2 sha512/g' "$l_authselect_file"
else
echo "No password hashing algorithm is set, updating to \"sha512\""
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix\.so\s+.*)$/& sha512/g' "$l_authselect_file"
fi
done
fi
authselect apply-changes