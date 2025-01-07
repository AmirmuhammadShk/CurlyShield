sudo visudo -f /etc/sudoers.d/myfile
Defaults use_pty
echo "/etc/sudoers.d/01_first" | sudo tee --append /etc/sudoers.d/ > /dev/null
echo "/etc/sudoers.d/10_second" | sudo tee --append /etc/sudoers.d/ > /dev/null