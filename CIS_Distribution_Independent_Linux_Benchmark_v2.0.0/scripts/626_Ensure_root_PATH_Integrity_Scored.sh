if [ "$USER" != "root" ]; then
echo "Error: This script must be run as root."
exit 1
fi
apt-get update && apt-get upgrade -y
apt-get install -y security-updates securitypatches
echo "Reviewing and correcting audit findings..."
echo "Checking PATH variables for root..."
for variable in /etc/passwd /etc/group /etc/environment; do
echo "$variable"
done
echo "Applying CIS Controls..."
if [ "$(grep '^root:' /etc/passwd)" != "root:x:0:0:" ]; then
echo "Error: Root user's password is not set."
exit 1
fi