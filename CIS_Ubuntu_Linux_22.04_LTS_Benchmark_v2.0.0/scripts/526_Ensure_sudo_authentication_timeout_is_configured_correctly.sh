if [ -f /etc/sudoers ]; then
visudo -f /etc/sudoers
fi
echo 'Defaults    env_reset, timestamp_timeout=15' >> /etc/sudoers
echo 'Defaults    timestamp_timeout=15' >> /etc/sudoers