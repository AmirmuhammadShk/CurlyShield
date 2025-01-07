visudo -f /etc/sudoers | grep -v -E 'NOPASSWD\|ALL:.*' > /tmp/temp_sudoers
mv /tmp/temp_sudoers /etc/sudoers