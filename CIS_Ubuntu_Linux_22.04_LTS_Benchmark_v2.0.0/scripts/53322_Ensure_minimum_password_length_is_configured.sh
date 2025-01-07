{
sed -ri 's/^\s*minlen\s*=/# &/' /etc/security/pwquality.conf
[ ! -d /etc/security/pwquality.conf.d/ ] && mkdir -p /etc/security/pwquality.conf.d/
printf '\n%s' "minlen = 14" > /etc/security/pwquality.conf.d/50-pwlength.conf
}
grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?minlen\b' /usr/share/pamconfigs/*
sed -ri 's/minlen=8/# &/' /usr/share/pamconfigs/*.conf
}