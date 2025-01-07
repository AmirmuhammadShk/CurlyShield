aa-enforce /etc/apparmor.d/*
if [ $? -ne 0 ]; then
echo "Error enforcing AppArmor profiles"
exit 1
fi