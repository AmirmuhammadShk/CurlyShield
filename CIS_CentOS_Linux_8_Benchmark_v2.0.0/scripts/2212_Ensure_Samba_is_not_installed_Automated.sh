dnf remove samba
if [ $? -eq 0 ]; then
echo "Samba successfully removed"
else
echo "Error removing Samba"
fi