visudo -f /etc/sudoers
sed 's/!authenticate//g' /etc/sudoers > temp && mv temp /etc/sudoers