sudo visudo -f /etc/sudoers
sed -i '/^# authenticate/d' /etc/sudoers  # On some systems, the authentication line is preceded by a comment
sed -i 's/!authenticate//g' /etc/sudoers  # Remove any occurrences of !authenticate