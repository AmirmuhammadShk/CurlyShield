l_module_name="unix"
l_pam_profile="$(head -1 /etc/authselect/authselect.conf)"
if grep -Pq -- '^custom\/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
echo "Running grep command:"
grep -P -- "\bpam_$l_module_name\.so\b" "$l_pam_profile_path"/{password,system}-auth
echo "Updating authselect profile template files if necessary:"
if [ $? -ne 0 ]; then
echo "Custom profile not found"
exit 1
fi
echo "Verifying pam_unix entries in custom profile:"
grep -P -- "\bpam_unix\.so\b" "$l_pam_profile_path"/{password,system}-auth
echo "Updating authselect profile template files if necessary:"
if [ $? -ne 0 ]; then
echo "Error: pam_unix module not found"
exit 1
fi