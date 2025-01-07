awk '/Password-Type:/{ f = 1;next } /-Type:/{ f = 0 } f {if (/pam_unix\.so/) print FILENAME}' /usr/share/pam-configs/* | \
while read file; do
echo "Editing $file..."
sed -i 's/try_first_pass yescrypt Try First Pass yescrypt/' /etc/pam.d/$file
done
pam-auth-update --enable unix