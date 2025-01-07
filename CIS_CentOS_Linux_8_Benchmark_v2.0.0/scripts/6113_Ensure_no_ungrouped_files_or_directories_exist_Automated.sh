ungrouped_files=$(find / -type f \( -nouser -o -gid ! -f \) -print)
if [ -n "$ungrouped_files" ]; then
# Reset ownership to active user
for file in $ungrouped_files; do
username=$(id -gunu -n "${file##*/}")
if [ $? -eq 0 ]; then
chown ${username} ${file}
else
echo "Error resetting ownership of ${file}: unable to determine owner"
fi
done
fi