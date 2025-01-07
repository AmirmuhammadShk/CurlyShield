find /etc/audit/ -type f \( -name '*.conf' -o -name '*.rules' \) ! -group root | xargs -I {} bash -c "chgrp root ${}"
# Run the command to change group to root
chgrp root /etc/audit/*.conf
chgrp root /etc/audit/*.rules