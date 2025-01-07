aa-enforce /etc/apparmor.d/
if [ $? -eq 0 ]; then
echo "All AppArmor profiles set to enforce mode."
else
echo "Failed to set all AppArmor profiles to enforce mode. Error: $?"
fi