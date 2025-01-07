l_module_name="faillock"
l_pam_profile="$(head -1 /etc/authselect/authselect.conf)"
if grep -Pq -- '^custom\/' <<< "$l_pam_profile"; then
l_pam_profile_path="/etc/authselect/$l_pam_profile"
else
l_pam_profile_path="/usr/share/authselect/default/$l_pam_profile"
fi
grep -P -- "\bpam_$l_module_name\.so\b"
"$l_pam_profile_path"/{password,system}-auth | grep pam_faillock.so | while read line; do
echo "$line"
done
if ! grep -q "pam_faillock.so preauth silent {include if \"with-faillock\"}" "$l_pam_profile_path" \
&& ! grep -q "pam_faillock.so authfail {include if \"with-faillock\"}" "$l_pam_profile_path"; then
echo 'authselect enable-feature with-faillock'
fi
if ! grep -q "pam_faillock.so preauth silent {include if \"with-faillock\"}" "$l_pam_profile_path" \
&& grep -q "pam_faillock\.so\b" "$l_pam_profile_path"/{password,system}-auth | grep pam_faillock.so | wc -l -ne 1; then
echo 'authselect apply-changes'
fi