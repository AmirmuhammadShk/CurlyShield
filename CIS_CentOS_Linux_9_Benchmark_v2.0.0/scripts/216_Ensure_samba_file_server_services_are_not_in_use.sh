systemctl stop smb.service
dnf remove --all Dependent --ignoreerrors samba
systemctl mask smb.service