yum update -y
if [ $(needs-restarting) == "yes" ]; then
echo "A reboot is required to load changes."
else
echo "No reboot required."
fi