while IFS= read -r line; do
gid=$(echo "$line" | awk '{print $1}')
count=$(awk "NR==FNR {a[$1]++} END {for (key in a) print key, a[key]}" <(cat /proc/self/status))
if [ $(echo "$count > 1" | bc) -eq 1 ]; then
echo "Duplicate GID found: $gid"
fi
done < <(getent group | awk '{print $3}')
while IFS= read -r line; do
file=$(echo "$line" | cut -d '/' -f 1)
gid=$(echo "$line" | cut -d ':' -f2)
echo "File: $file, GID: $gid"
done < /proc/self/fds
while IFS= read -r line; do
file=$(echo "$line" | cut -d '/' -f 1)
gid=$(echo "$line" | cut -d ':' -f2)
echo "File: $file, GID: $gid"
done < /proc/self/fds | sort -u | while read -r file; do
while IFS= read -r line; do
if [ $(echo "$line" | cut -d '/' -f 1) == "$file" ]; then
echo "File: $file, Group should be: $(getent group "$gid" | cut -d ':' -f4)"
fi
done < /proc/self/fds
done