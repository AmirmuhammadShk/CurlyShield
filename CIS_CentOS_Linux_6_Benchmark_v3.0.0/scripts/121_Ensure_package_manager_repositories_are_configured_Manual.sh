echo "Configure your package manager repositories according to site policy."
echo "Please note that this is a CIS Control for security and compliance."
if ! sudo apt-get update; then
echo "Failed to update package list. Please try again."
exit 1
fi