if ! apt purge -y autofs &> /dev/null; then
echo "Failed to remove autofs"
fi
if systemctl stop autofs &> /dev/null; then
if ! systemctl mask autofs &> /dev/null; then
echo "Failed to mask autofs"
fi
else
echo "Autofs is already stopped"
fi