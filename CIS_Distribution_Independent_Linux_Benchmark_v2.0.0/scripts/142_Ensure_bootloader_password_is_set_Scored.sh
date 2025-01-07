if [ "$(uname -s)" == "Linux" ]; then
# Create an encrypted password with grub-md5-crypt
echo "Enter password: $(grub-crypt --md5 --iter 10000)"
read -p "Retype Password: " retype_password
if [ "$retype_password" == "$(grub-crypt --md5 --iter 10000)" ]; then
encrypted_password=$(grub-crypt --md5 --iter 10000)
echo "Password set for grub based systems: $encrypted_password"
else
echo "Passwords do not match. Please try again."
exit 1
fi
# Add the password to /boot/grub/menu.lst
echo "password $(grub-crypt --md5 --iter 10000)"
elif [ "$(uname -s)" == "Darwin" ]; then
echo "This platform does not support grub-md5-crypt"
fi
if [ "$(uname -s)" == "Linux" ]; then
# Create an encrypted password with grub-mkpasswd-pbkdf2
echo "Enter password: $(grub-mkpasswd-pbkdf2)"
read -p "Reenter Password: " retype_password
if [ "$retype_password" == "$(grub-mkpasswd-pbkdf2)" ]; then
encrypted_password=$(grub-mkpasswd-pbkdf2)
echo "Password set for grub2 based systems: $encrypted_password"
else
echo "Passwords do not match. Please try again."
exit 1
fi
# Add the password to /etc/grub.d/00_header
cat <<EOF > /etc/grub.d/00_header
set superusers="<username>"
password_pbkdf2 "<username> $encrypted_password"
EOF
fi
if [ "$(uname -s)" == "Linux" ]; then
# Run the following command to update the grub2 configuration
echo "Updating grub2 configuration..."
grub2-mkconfig -o /boot/grub2/grub.cfg
# Or update-grub for compatibility with older systems
# grub2-mkconfig -o /boot/grub/grub.cfg
fi