l_pam_profile=$(head -1 /etc/authselect/authselect.conf)
if grep -Pq -- '^custom/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
for authselect_file in "$l_pam_profile_path"/password-auth "$l_pam_profile_path"/system-auth; do
if grep -Pq --
'^.*pam_unix\.so\ .*use_authtok\b' <<< "$authselect_file"; then
echo "- \"use_authtok\" is already set"
else
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix\.so\s+.*)/& use_authtok/g' "$authselect_file"
fi
done
for file in /etc/pam.d/password-auth /etc/pam.d/system-auth; do
if grep -q -- '^pam_unix.so.*use_authtok\b' <<< "$(cat "$file")"; then
echo "- File $file already includes use_authtok"
else
sed -ri 's/pam_unix\.so.*/pam_unix.so sha512 shadow {if not "without-nullok":nullok} use_authtok/' "$file"
fi
done
authselect apply-changes