for l_pam_file in system-auth password-auth; do
l_file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$l_pam_file"
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix\.so\s+.*)(nullok)(\s*.*)/\1\2\4/g' $l_file
done
authselect enable-feature without-nullok
authselect apply-changes