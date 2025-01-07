sed -i 's/crypt_style = .*/crypt_style = sha512/' /etc/libuser.conf
echo "ENCRYPT_METHOD SHA512" >> /etc/login.defs
for fn in system-auth password-auth; do
file="/etc/authselect/$(head -1 /etc/authselect/authselect.conf | grep 'custom/')/$fn"
if ! grep -Pq -- '^^\h*password\h+(requisite|required|sufficient)\h+pam_unix\.so(\h+[^#\n\r]+)?\h+sha512\b.*$' "$file"; then
sed -ri "s/(md5|blowfish|bigcrypt|sha256)/sha512/" "$file"
else
sed -ri 's/(^\s*password\s+(requisite|required|sufficient)\s+pam_unix.so\s+)(.*)$/\1sha512 \3/' $file
fi
done
authselect apply-changes