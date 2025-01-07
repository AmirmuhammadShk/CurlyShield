{
sed -ri 's/^\s*maxrepeat\s*=/# &/' /etc/security/pwquality.conf
[ ! -d /etc/security/pwquality.conf.d/ ] && mkdir -p /etc/security/pwquality.conf.d/
printf '\n%s' "maxrepeat = 3" > /etc/security/pwquality.conf.d/50-pwrepeat.conf
}
grep -Pl -- '\bpam_pwquality\.so\h+([^#\n\r]+\h+)?maxrepeat\b' /usr/share/pam-configs/* |
sed 's/maxrepeat=0/maxrepeat=3/' | xargs -I {} bash -c 'echo "{}" >> {}/etc/security/pwquality.conf'
}