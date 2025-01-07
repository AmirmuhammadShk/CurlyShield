l_module_name="pwquality"
l_pam_profile="$(head -1 /etc/authselect/authselect.conf)"
if grep -Pq -- '^custom\/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
grep -P -- "\bpam_$l_module_name\.so\b" "$l_pam_profile_path"/{password,system}-auth | while read line; do
echo "pam_pwquality.so local_users_only {include if \"with-pwquality\"}"
done
if grep -qP -- "{include if \\"with-pwquality\\"}" <<< "$l_pam_profile"; then
authselect enable-feature with-pwquality
elif ! grep -P -- "\bpam_$l_module_name\.so\b" "$l_pam_profile_path"/{password,system}-auth; then
authselect apply-changes
fi