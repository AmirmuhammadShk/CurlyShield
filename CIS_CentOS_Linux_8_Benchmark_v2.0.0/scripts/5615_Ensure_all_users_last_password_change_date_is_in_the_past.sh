future_changers=$(getent passwd | awk -F: '$4 > $(date -d "+1 month" +%s) {print $1}')
if [ -n "$future_changers" ]; then
# Correct the issue for each user
for user in $future_changers; do
echo "Locking account and expiring password for user $user"
getent passwd $user | sed 's/.*: \(.*\)/password = \( \)\.expire_date = \1./'
echo "Corrected by admin on $(date)"
done
fi