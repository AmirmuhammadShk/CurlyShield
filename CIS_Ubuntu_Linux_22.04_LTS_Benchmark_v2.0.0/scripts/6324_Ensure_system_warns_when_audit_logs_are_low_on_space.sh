echo "space_left_action = email" >> /etc/audit/auditd.conf
if [ $? -ne 0 ]; then
echo "Failed to set space_left_action"
exit 1
fi
echo "admin_space_left_action = single" >> /etc/audit/auditd.conf
if [ $? -ne 0 ]; then
echo "Failed to set admin_space_left_action"
exit 1
fi