if [ ! -d "/etc/security/pwquality.conf.d/" ]; then
mkdir -p "/etc/security/pwquality.conf.d/"
fi
printf '\n%s' "difok = 2" > "/etc/security/pwquality.conf.d/50-pwdifok.conf"
for file in "/usr/share/pam-configs/*"; do
if grep -q -P "\bpam_pwquality\.so\h+([^#\n\r]+\h+)?difok\b" "$file"; then
sed -ri 's/^\s*difok\s*=/# &/' "$file"
fi
done
grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?difok\b' "/usr/share/pam-configs/*"
if [ ! -f "/etc/security/pwquality.conf.d/50-pwdifok.conf" ]; then
printf '\n%s' "difok = 2" > "/etc/security/pwquality.conf.d/50-pwdifok.conf"
fi