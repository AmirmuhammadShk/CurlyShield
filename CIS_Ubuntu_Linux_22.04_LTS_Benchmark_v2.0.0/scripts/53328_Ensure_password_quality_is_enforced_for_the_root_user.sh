mkdir -p /etc/security/pwquality.conf.d/
printf '\n%s\n' "enforce_for_root" > /etc/security/pwquality.conf.d/50-pwroot.conf