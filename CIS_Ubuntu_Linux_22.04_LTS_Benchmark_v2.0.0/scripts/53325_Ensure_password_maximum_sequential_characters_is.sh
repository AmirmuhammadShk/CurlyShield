{
sed -ri 's/^\s*maxsequence\s*=/# &/' /etc/security/pwquality.conf
[ ! -d /etc/security/pwquality.conf.d/ ] && mkdir -p /etc/security/pwquality.conf.d/
printf '\n%s' "maxsequence = 3" > /etc/security/pwquality.conf.d/50-pwmaxsequence.conf
} &
grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?maxsequence\b' /usr/share/pam-configs/* | sed 's/maxsequence=0/maxsequence=/g'
{
printf '\n%s' "maxsequence = 3" > /etc/security/pwquality.conf.d/50-pwmaxsequence.conf
} &
grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?maxsequence\b' /usr/share/pam-configs/* | sed 's/maxsequence=0/maxsequence=/g'
update-pam-dict