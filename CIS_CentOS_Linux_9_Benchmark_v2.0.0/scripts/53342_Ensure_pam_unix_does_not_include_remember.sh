l_pam_profile=$(head -1 /etc/authselect/authselect.conf)
if grep -Pq -- '^custom/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
grep -P -- '^\h*password\h+([^#\n\r]+\h+)pam_unix\.so\b' "$l_pam_profile_path"/{password,system}-auth | while read line; do
if [[ $line =~ ^password.*sufficient ]]; then
echo "pam_unix.so sha512 shadow {if not \"without-nullok\":nullok} use_authtok"
else
echo "$line"
fi
done
for l_authselect_file in "$l_pam_profile_path"/password-auth "$l_pam_profile_path"/system-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix\.so\s+.*)(remember=[1-9][0-9]*)(\s*.*)/\1\4/g' "$l_authselect_file"
done
for l_authselect_file in /etc/pam.d/password-auth /etc/pam.d/system-auth; do
sed -ri 's/^\s*auth\s+\(required\)\s*pam_unix\.so\s+.*remember=/auth \1 pam_unix.so sha512 shadow {if not "without-nullok":nullok} use_authtok/g' "$l_authselect_file"
done