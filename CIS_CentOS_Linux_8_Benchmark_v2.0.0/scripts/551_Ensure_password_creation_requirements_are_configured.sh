echo "minlen = 14" >> /etc/security/pwquality.conf
echo "minclass = 4 dcredit = -1 ucredit = -1 ocredit = -1 lcredit = -1" >> /etc/security/pwquality.conf
for fn in system-auth password-auth; do
file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$fn"
if ! grep -Pq -- '^password requisite pam_pwquality.so.*enforce_for_root\b' "$file"; then
sed -ri 's/^\s*(password\s+requisite\s+pam_pwquality.so\s+)(.*)$/\1\2 enforce_for_root/' "$file"
fi
if grep -Pq -- '^password requisite pam_pwquality.so.*retry=[4-9]\b' "$file"; then
sed -ri '/pwquality/s/retry=\S+/retry=3/' "$file"
elif ! grep -Pq -- '^password requisite pam_pwquality.so.*retry=\d+\b' "$file"; then
sed -ri 's/^\s*(password\s+requisite\s+pam_pwquality.so\s+)(.*)$/\1\2 retry=3/' "$file"
fi
done
authselect apply-changes