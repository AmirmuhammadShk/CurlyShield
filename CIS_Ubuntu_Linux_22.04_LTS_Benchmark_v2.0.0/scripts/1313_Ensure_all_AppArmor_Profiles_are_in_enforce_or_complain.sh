aa-enforce /etc/apparmor.d/*
if [ $? -ne 0 ]; then
echo "Failed to set all profiles to enforce mode"
fi
aa-complain /etc/apparmor.d/*
if [ $? -ne 0 ]; then
echo "Failed to set all profiles to complain mode"
fi