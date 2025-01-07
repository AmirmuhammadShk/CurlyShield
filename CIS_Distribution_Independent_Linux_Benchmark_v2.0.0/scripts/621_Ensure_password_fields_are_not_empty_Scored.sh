for user in $(cat /etc/shadow | cut -d: -f1); do
if [ "$(grep -q "^$user:" /etc/shadow)" = "" ]; then
passwd -l $user
fi
done
ps -ef | grep -v $(whoami) > /dev/null && echo "Locked out user found. Investigate and take necessary actions."