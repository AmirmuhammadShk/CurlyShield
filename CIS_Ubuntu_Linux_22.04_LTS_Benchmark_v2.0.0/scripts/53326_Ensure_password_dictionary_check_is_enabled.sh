for file in /etc/security/pwquality.conf.d/*.conf /etc/security/pwquality.conf; do
sed -ri 's/^\s*dictcheck\s*=/# &/' "$file"
done
grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?dictcheck\b' /usr/share/pam-configs/* | grep -q 'dictcheck=1'
if ! grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?dictcheck\b' /usr/share/pam-configs/* | grep -q 'dictcheck=0'; then
sed -ri 's/^\s*dictcheck\s*=/dictcheck=1/' /etc/security/pwquality.conf.d/*.conf /etc/security/pwquality.conf
fi