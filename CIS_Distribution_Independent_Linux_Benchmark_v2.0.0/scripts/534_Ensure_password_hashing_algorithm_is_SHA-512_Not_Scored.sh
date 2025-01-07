password sufficient pam_unix.so sha512
while IFS= read -r user; do
uid=$(getent passwd $user | cut -d: -f6)
if [ $uid -ge 500 ] && [ "$user" != "nfsnobody" ]; then
chage -d 0 $user
fi
done
Note: This script will only expire user IDs that are greater than or equal to 500, but the actual value may vary depending on your distribution and UID split setting.