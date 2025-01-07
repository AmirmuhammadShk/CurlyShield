gids=$(getent group | awk '{print $1}' | sort -u | grep -v ^$
if [ -n "$gids" ]; then
# Establish unique GIDs
echo "Establishing unique GIDs..."
for gid in $gids; do
if ! groupdel $gid &> /dev/null; then
echo "Error: Unable to delete existing GID $gid"
fi
done
# Review all files owned by shared GID and determine their correct group
echo "Reviewing files owned by shared GIDs..."
for file in /etc/passwd /etc/group /var/log/audit.log; do
while IFS= read -r line; do
if [[ $line =~ ^gid: ]]; then
gid=$(echo "$line" | cut -d: -f2)
group=$(getent group $gid | awk '{print $1}')
# Check if file is owned by shared GID and not the intended group
if [ "$(stat -c %g "$file")" -ne $gid ]; then
echo "File $file owned by GID $gid, not $group. Please review."
fi
fi
done < "$file"
done
else
echo "No duplicate GIDs found."
fi