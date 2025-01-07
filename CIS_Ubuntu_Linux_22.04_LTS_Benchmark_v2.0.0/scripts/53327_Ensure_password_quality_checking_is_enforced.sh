if grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?enforcing=0\b' /usr/share/pam-configs/*; then
# Edit returned files and remove enforcing=0 argument from pam_pwquality.so line(s)
sed -ri 's/^\s*enforcing\s*=\s*0/# &/' /etc/security/pwquality.conf
for file in /etc/security/pwquality.conf.d/*.conf; do
if grep -q 'enforcing=0' "$file"; then
sed -ri 's/^\s*enforcing\s*=\s*0/# &/' "$file"
fi
done
# Enforce password quality checking
echo "enforcing=1" > /etc/security/pwquality.conf
fi