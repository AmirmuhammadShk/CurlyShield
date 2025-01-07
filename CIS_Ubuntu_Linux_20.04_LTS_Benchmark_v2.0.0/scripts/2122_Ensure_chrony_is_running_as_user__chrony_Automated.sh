echo "Add or edit the user line to /etc/chrony/chrony.conf or a file ending in .conf in /etc/chrony/conf.d/:"
echo "  user _chrony"
if apt list --installed | grep -q 'time-sync'; then
echo "Remove chrony from the system:"
echo "  apt purge chrony"
else
echo "No other time synchronization service is in use."
fi