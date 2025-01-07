sed -i '/^Include/,/^\$/ { s/HostbasedAuthentication.*// }' /etc/ssh/sshd_config
grep '^HostbasedAuthentication' /etc/ssh/sshd_config | sed -r 's/^HostbasedAuthentication\s+([a-zA-Z_]+)\.*/\1 no/'