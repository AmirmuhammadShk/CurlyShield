sed -ri 's/^\s*minclass\s*=/# &/' /usr/share/pam-configs/* | grep -q "pam_pwquality\.so" && sed -i 's/^\s*[dulo]credit\s*=/# &/' /usr/share/pam-configs/*
[ ! -f /etc/security/pwquality.conf ] && echo "minclass = 0
dcredit = 0
ucredit = 0
ocredit = 0
lcredit = 0" > /etc/security/pwquality.conf || sed -i '/^$/q' /etc/security/pwquality.conf
minclass=3
dcredit=-1
ucredit=-1
lcredit=-1
if [ ! -d /etc/security/pwquality.conf.d/ ]; then
mkdir /etc/security/pwquality.conf.d/
fi
printf '\n%s' "minclass = $minclass" > /etc/security/pwquality.conf.d/50-pwcomplexity.conf || printf '%s\n' "$dcredit" "$ucredit" "$lcredit" > /etc/security/pwquality.conf.d/50-pwcomplexity.conf