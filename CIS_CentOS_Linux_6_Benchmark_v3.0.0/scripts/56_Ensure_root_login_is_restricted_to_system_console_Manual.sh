rm -rf /etc/secure/shell
sed -i '/^root:/c\root:consoleonly:' /etc/passwd
echo "Root login restricted to system console."