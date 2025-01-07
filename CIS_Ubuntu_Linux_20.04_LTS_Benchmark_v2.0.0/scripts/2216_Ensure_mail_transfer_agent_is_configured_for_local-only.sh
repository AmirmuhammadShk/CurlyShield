!/bin/bash
edit_postfix_config() {
local new_line="inet_interfaces = loopback-only"
while IFS= read -r line; do
if [[ "$line" =~ ^inet_interfaces ]]; then
sed -i "s/inet_interfaces.*$/${new_line}/g" /etc/postfix/main.cf
fi
done < /etc/postfix/main.cf
systemctl restart postfix
}
edit_postfix_config