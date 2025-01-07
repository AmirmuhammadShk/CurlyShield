read -p "Enter new password: " password
read -s -p "Re-type password: " retype_password
if [ "$password" = "$retype_password" ]; then
encrypted_password=$(grub-md5-crypt --md5 "$password")
else
echo "Passwords do not match. Aborting."
exit 1
fi
echo "password --md5 $encrypted_password" >> /boot/grub/grub.conf