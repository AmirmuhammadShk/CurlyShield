!/bin/bash
sed -i '/^#|^$/ /etc/ssh/sshd_config' 's/^#.*$/ignorerhosts yes/'