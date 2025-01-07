deny=5
unlock_time=900
sed -ri '/pam_faillock.so/s/deny=\S+/deny=5/g' /etc/security/faillock.conf
for fn in system-auth password-auth; do
file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$fn"
if grep -Pq -- '^auth required pam_faillock.so deny=(0|[6-9]|[1-9][0-9]+)\b.*$' "$file"; then
sed -ri '/pam_faillock.so/s/deny=\S+/deny=5/g' "$file"
elif ! grep -Pq -- '^auth required pam_faillock.so deny=\d*\b.*$' "$file"; then
sed -r 's/^\s*(auth\s+required\s+pam_faillock\.so\s+)([^{}#\n\r]+)?\s*(\{.*\})?(.*)/\1\2\3 deny=5 \4/' "$file"
fi
if grep -P -- '^auth required pam_faillock.so unlock_time=([1-9]|[1-9][0-9]|[1-8][0-9][0-9])\b.*$' "$file"; then
sed -ri '/pam_faillock.so/s/unlock_time=\S+/unlock_time=900/g' "$file"
elif ! grep -Pq -- '^auth required pam_faillock.so unlock_time=\d*\b.*$' "$file"; then
sed -r 's/^\s*(auth\s+required\s+pam_faillock\.so\s+)([^{}#\n\r]+)?\s*(\{.*\})?(.*)/\1\2\3 unlock_time=900 \4/' "$file"
fi
done
authselect apply-changes
deny=3
unlock_time=600