sed -ri 's/^\s*(CRYPTO_POLICY\s*=.*$)# \1/' /etc/sysconfig/sshd
systemctl reload sshd