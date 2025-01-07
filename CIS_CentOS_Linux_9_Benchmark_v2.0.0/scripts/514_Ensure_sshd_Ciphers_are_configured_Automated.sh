update-crypto-policies --set DEFAULT:NO-SHA1:NO-WEAKMAC:NO-SSHCBC:NO-SHACHACHA20:NO-SSHWEAKCIPHERS
systemctl reload-or-restart sshd