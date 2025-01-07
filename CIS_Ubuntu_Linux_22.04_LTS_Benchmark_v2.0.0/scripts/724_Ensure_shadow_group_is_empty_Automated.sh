sed -ri 's/(^shadow:[^:]*:[^:]*:)([^:]+$)/\1/' /etc/group
usermod -g $(getent group shadow | cut -d: -f4) $USER