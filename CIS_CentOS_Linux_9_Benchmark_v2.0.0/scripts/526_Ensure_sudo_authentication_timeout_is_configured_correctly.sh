if [ $(cat /etc/sudoers | grep -c 'timestamp_timeout') -gt 0 ]; then
visudo -f /etc/sudoers \
| sed -i '/^Defaults$/,/^\s*timestamp_timeout=/c "Defaults env_reset, timestamp_timeout=15'"
fi