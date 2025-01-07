pam-auth-update --enable unix
if [ -f /etc/pam.d/common* ]; then
sed -i 's/^\#.*$//; s/\(faillock\).*/\1 enable/' /etc/pam.d/common*
fi
if [ -f /etc/pam.d/* ]; then
sed -i '/^auth\s\+require pam_faillock.so.*$/d' /etc/pam.d/*
fi