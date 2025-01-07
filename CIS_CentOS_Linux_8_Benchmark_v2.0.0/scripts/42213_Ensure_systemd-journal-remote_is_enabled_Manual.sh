!/bin/bash
systemctl --now enable systemd-journal-remote
systemctl start systemd-journal-upload.service
systemctl status systemd-journal-upload.service