sed -i '/^ENCRYPT_METHOD/s/SHA512/YESCRYPT/' /etc/login.defs
echo "Update all group passwords to use stronger hashing algorithm"