sed -ri 's/(^\s*minlen\s*=\s*[0-9]+)(.*)/\1=14\2/' /etc/security/pwquality.conf
for l_pam_file in system-auth password-auth; do
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_pwquality\.so.*)(\s+minlen\s*=\s*[0-9]+)(.*)/\1\4/' /etc/pam.d/"$l_pam_file"
done
sed -ri 's/minlen\s*=\s*[0-9]\+/minlen = 8/' /etc/security/pwquality.conf