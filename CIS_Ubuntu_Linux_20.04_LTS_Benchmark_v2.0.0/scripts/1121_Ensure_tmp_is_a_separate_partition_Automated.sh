echo "tmpfs /tmp tmpfs defaults,rw,nosuid,nodev,noexec,relatime 0 0" | tee -a /etc/fstab
cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/
echo "SpDX-License-Identifier: LGPL-2.1+" | tee -a /etc/systemd/system/tmp.mount
echo "" | tee -a /etc/systemd/system/tmp.mount
echo "# This file is part of systemd." | tee -a /etc/systemd/system/tmp.mount
echo "# systemd is free software; you can redistribute it and/or modify it" | tee -a /etc/systemd/system/tmp.mount
echo "# under the terms of the GNU Lesser General Public License as published by" | tee -a /etc/systemd/system/tmp.mount
echo "# the Free Software Foundation; either version 2.1 of the License, or" | tee -a /etc/systemd/system/tmp.mount
echo "# (at your option) any later version." | tee -a /etc/systemd/system/tmp.mount
systemctl daemon-reload
systemctl --now enable tmp.mount