if ! sudo yum list installed | grep -q "system-journal-gateway"; then
# Install system-journal-gateway
sudo yum install system-journal-gateway
fi