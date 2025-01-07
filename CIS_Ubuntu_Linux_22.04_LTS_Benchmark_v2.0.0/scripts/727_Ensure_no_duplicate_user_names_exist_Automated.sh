while IFS= read -r line; do
if [[ $line =~ ^username:[^:]+:$UID ]]; then
old_username=${BASH_REMATCH[1]}
new_uid=$(awk '{print NR}' /etc/passwd | cut -d: -f1 | grep -v "^$old_username:" | awk '{print $1}')
echo "Updating username '$old_username' to 'new_user_$new_uid'" >&2
usermod -u "$new_uid" $old_username || { echo "Error updating username"; exit 1; }
fi
done < /etc/passwd