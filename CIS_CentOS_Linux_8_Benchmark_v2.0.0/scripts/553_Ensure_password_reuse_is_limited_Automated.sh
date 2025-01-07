{
file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/system-auth"
if ! grep -Pq -- '^password.*requisite|sufficient' "$file"; then
sed -ri '/^\s*password.*pam_unix.so/s/$/ remember=5/' "$file"
elif grep -Pq -- '^password.*pam_unix\.so' "$file"; then
sed -ri '/^\s*(password\s+(requisite|required|sufficient)\s+pam_pwhistory\.so\s+[^#]+) s/remember=\S+\b remember=5/' "$file"
else
echo "Insufficient configuration found in /etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/system-auth"
fi
authselect apply-changes
}