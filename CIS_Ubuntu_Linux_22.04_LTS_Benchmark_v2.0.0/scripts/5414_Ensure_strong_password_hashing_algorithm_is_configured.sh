sed -i '/^ENCRYPT_METHOD$/ s/SHA512/YESCRYPT/' /etc/login.defs
echo "ENCRYPT_METHOD SHA512" | sed 's/.*/\n&/' >> /etc/login.defs