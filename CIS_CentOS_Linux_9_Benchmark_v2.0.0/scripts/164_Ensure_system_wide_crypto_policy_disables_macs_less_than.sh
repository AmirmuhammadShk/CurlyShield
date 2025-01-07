update-crypto-policies --set DEFAULT:NO-SHA1:NO-WEAKMAC
mkdir -p /etc/crypto-policies/policies/modules/
echo "mac = -*-64" >> /etc/crypto-policies/policies/modules/NO-WEAKMAC.pmod
reboot