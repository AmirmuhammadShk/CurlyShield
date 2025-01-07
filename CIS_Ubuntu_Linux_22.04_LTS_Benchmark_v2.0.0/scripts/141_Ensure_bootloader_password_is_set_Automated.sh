grub-mkpasswd-pbkdf2 --iteration-count=600000 --salt=64
read -p "Enter password: " password1
read -s -p "Reenter password: " password2
if [ "$password1" = "$password2" ]; then
encrypted_password=$(echo -n "$password1" | grub-mkpasswd-pbkdf2 --iteration-count=600000 --salt=64)
cat <<EOF > /boot/grub/grub.cfg
exec tail -n +2 \$0
set superusers="<username>"
password_pbkdf2 <username> "${encrypted_password#*=}"
EOF
update-grub
fi