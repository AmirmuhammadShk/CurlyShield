echo "Creating or updating the /etc/sysconfig/ip6tables file..." >> /var/log/sysconfig.ip6tables
service ip6tables save
if [ $? -eq 0 ]; then
echo "Verification: The /etc/sysconfig/ip6tables file has been created or updated successfully."
else
echo "Error: Unable to create or update the /etc/sysconfig/ip6tables file. Error code: $?"
fi
echo "Reviewing the current running ip6tables configuration..."
ip6tables -L | grep ^Chain