sed -i 's/^ClientAliveInterval[[:space:]]*//; s/^Default ClientAliveInterval[[:space:]]*/\n' \
s/^ClientAliveCountMax[[:space:]]*3/3/' /etc/ssh/sshd_config
systemctl restart sshd