echo "Removing existing motd file..."
rm -f /etc/motd
echo "Configuring new message of the day..."
echo "Your site's message of the day here" | tee /etc/motd