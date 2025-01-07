l_module_name="pwhistory"
l_pam_profile=$(head -1 /etc/authselect/authselect.conf)
if grep -Pq -- '^custom\/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
grep -P -- "\bpam_$l_module_name\.so\b" "$l_pam_profile_path"/{password,system}-auth | grep -q "{include if 'with-pwhistory'}"
if [ $? -eq 0 ]; then
echo "Authselect profile already includes pam_pwhistory module"
else
authselect enable-feature with-pwhistory
fi
if ! grep -P -- "\bpam_$l_module_name\.so\b" "$l_pam_profile_path"/{password,system}-auth | grep -q "{include if 'with-pwhistory'}"; then
authselect apply-changes
fi