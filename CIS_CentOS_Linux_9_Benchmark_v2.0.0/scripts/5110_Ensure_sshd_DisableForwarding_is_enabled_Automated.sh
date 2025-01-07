sed -i '/^Include/ i DisableForwarding yes' /etc/ssh/sshd_config
This script enables the DisableForwarding parameter to 'yes' in the /etc/ssh/sshd_config file, ensuring that forwarding is disabled.