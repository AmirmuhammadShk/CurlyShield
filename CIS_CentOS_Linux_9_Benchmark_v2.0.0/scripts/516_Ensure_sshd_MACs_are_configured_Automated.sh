update-crypto-policies --set DEFAULT:NO-SHA1:NO-WEAKMAC:NO-SSHCBC:NO-SSHCHACHA20:NO-SSHETM:NO-SSHWEAKCIPHERS
systemctl reload-or-restart sshd
printf '%s\n' "# This is a subpolicy to disable weak MACs" "# for the SSH protocol (libssh and OpenSSH)" "mac@SSH = -HMAC-MD5* -UMAC-64* -UMAC-128*" > /etc/crypto-policies/policies/modules/NO-SSHWEAKMACS.pmod
systemctl reload-or-restart sshd