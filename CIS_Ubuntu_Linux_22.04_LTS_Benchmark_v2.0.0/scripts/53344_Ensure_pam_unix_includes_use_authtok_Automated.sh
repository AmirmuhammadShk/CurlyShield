for file in /usr/share/pam-configs/*; do
if [ -f "$file" ]; then
awk '/pam_unix\.so/ { print file}' /etc/pam.d/$file | xargs sed 's/^\(.*\)://g'
fi
done
for file in /usr/share/pam-configs/*; do
if [ -f "$file" ]; then
password_line=$(awk '/Password-Type:/{ f = 1;next } /-Type:/{ f = 0 } f {if (/pam_unix\.so/) print FILENAME}' /etc/pam.d/$file | xargs sed 's/^\(.*\)://g')
if [ -n "$password_line" ]; then
password_file=$(basename $file)
sed -i "/$password_line/s/use_authtok/,/^\(.*\)://g s/obscure use_authtok/obscure try_first_pass/" /etc/pam.d/$password_file
fi
fi
done
MODIFIED_PROFILE_NAME="unix"
pam-auth-update --enable $MODIFIED_PROFILE_NAME