if [ -f /etc/sudoers ]; then
visudo -f /etc/sudoers | sed '/^# Defaults.*NOPASSWD/d' > temp && mv temp /etc/sudoers
fi