grub2-setpassword -c <password> <username>
set_password() {
echo "Enter password:"
read password
if [ "$password" != "$(echo "$password" | grub2-password --encrypted)" ]; then
echo "Password mismatch. Please try again."
set_password
fi
}
set_password
echo "Ensure bootloader password is set."