for user in $(cat /etc/shadow | cut -d: -f1); do
if [ -z "$user:x:" ]; then
echo "Account $user locked until further notice."
passwd -l $user &
echo "Investigate account $user usage and determine if it should be forced off"
fi
done