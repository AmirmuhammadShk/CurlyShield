for group in $(getent group | awk '{print $1}'); do
unique_group=$(echo "$group" | tr '[:upper:]' '[:lower:]' | fold -w1 | sort -u)
if [ "$group" != "$unique_group" ]; then
echo "Duplicate group name found: $group"
new_gid=$((/etc/group/$group|awk '{print $3}'+1))
usermod -g $new_gid $(getent passwd | awk -F: '$2 == "'$group'"' { print $1 }')
fi
done
find /path/to/your/directory -type f -exec chown -R :$(awk '/gid={}' $HOME/.ssh/id_ed25519 | cut -d '=' -f2-) {} \;