sed -i '/Include/{s/.*//; i \nIgnoreRhosts\n}' /etc/ssh/sshd_config
sed -i 's/^IgnoreRhosts.*$/IgnoreRhosts yes/' /etc/ssh/sshd_config