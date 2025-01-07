#!/bin/bash
if [ $(cat /etc/sudoers | grep 'timestamp_timeout=' | awk '{print $NF}') -gt 15 ]; then
visudo -f /etc/sudoers && sed -i '/^Defaults/d' /etc/sudoers && echo "Defaults    env_reset, timestamp_timeout=15" >> /etc/sudoers || echo 'Error editing sudoers file'
fi