{
l_pam_profile="$(head -1 /etc/authselect/authselect.conf)"
if grep -Pq -- '^custom\/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
for l_authselect_file in "$l_pam_profile_path"/password-auth
"$l_pam_profile_path"/system-auth; do
if grep -Pq '^password\h+(requisite|required|sufficient)\h+pam_pwhistory\.so\h+([^#\n\r]+)?use_authtok\b' "$l_authselect_file"; then
echo "use_authtok already set"
else
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwhistory\.so\s+.*)$/
& use_authtok/g' "$l_authselect_file"
echo "Updating template for $l_authselect_file"
fi
done
} | while read line; do
sed -i 's/^\h*password\h+(requisite|required|sufficient)\h+pam_pwhistory\.so\h+([^#\n\r]+)? /& use_authtok /g' "/etc/pam.d/$line"
done