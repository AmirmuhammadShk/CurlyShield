update-crypto-policies --set DEFAULT:NO-SHA1:NO-SSHCBC
echo "-CHACHA20-POLY1305" >> /etc/crypto-policies/policies/modules/NO-SHATCHACHA20.pmod
reboot