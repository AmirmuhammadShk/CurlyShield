encrypted_password=$(grub-mkpasswd-pbkdf2)
password=$encrypted_password
cat <<EOF > /boot/grub/grub.cfg
set superusers="<username>"
password_pbkdf2 <username> $encrypted_password
EOF
update-grub