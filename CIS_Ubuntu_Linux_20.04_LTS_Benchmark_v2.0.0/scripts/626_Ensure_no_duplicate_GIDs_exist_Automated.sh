if [ -d /etc/group ]; then
# Check if any groups have the same primary group ID
existing_groups=$(getent group | awk '{print $1}' | sort -u)
for gid in $existing_groups; do
count=0
for file in $(find / -type f -exec stat -c "%G" {} \;); do
if [ ${file: -2} == ':'$gid ]; then
((count++))
fi
done
if [ $count -gt 1 ]; then
# If more than one file is owned by this group, review the files and determine which group they should belong to.
echo "Duplicate GIDs found for group $gid."
# Review all files owned by this shared GID
for file in $(find / -type f -exec stat -c "%G" {} \;); do
if [ ${file: -2} == ':'$gid ]; then
# Determine the correct group ID for this file
echo "File $file should belong to group $(getent group | awk \"\$1 != '$gid' {print \$1}\")"
fi
done
fi
done
fi