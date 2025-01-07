sed -i 's/MaxAuthTries.*$/MaxAuthTries 4/' /etc/ssh/sshd_config
awk '!/^\s*MaxAuthTries/{p=1;next} p' /etc/ssh/sshd_config > tmp && mv tmp /etc/ssh/sshd_config