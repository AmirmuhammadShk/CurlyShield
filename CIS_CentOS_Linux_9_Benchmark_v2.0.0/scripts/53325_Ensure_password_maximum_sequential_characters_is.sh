sed -ri 's/^\s*maxsequence\s*=/# &/' /etc/security/pwquality.conf
printf '\n%s' "maxsequence = 3" >> /etc/security/pwquality.conf.d/50-pwmaxsequence.conf
authselect apply-changes