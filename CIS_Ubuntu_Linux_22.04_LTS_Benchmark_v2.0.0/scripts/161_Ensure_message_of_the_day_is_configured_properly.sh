if [ -f "/etc/motd" ]; then
# Remove existing contents and configure with recommended policy
sed -i '/[\m\r\s\v]/d' /etc/motd
cat << EOF > /etc/motd
EOF
fi
if [ $? -eq 0 ]; then
# Motd file exists and was modified successfully
else
# Error occurred while modifying motd file, log it for further review
echo "Error modifying /etc/motd" >&2
exit 1
fi