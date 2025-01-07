systemctl disable cups
rm -rf /etc/cups
echo "Disabling CUPS has been successful."
echo "Note: Disabling CUPS will prevent printing from the system."
if [ $? -eq 0 ]; then
echo "CUPS has been disabled successfully."
else
echo "Error disabling CUPS. Please refer to the logs for more information."
fi