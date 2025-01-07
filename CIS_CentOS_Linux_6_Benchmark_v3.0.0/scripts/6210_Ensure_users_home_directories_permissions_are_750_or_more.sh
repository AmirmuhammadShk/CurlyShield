user_home_dirs=$(awk -F: '($1!~/(halt|sync|shutdown)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/
&& $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $6}' /etc/passwd)
for dir in $user_home_dirs; do
if [ -d "$dir" ]; then
# Get the current permissions of the directory
perms=$(stat -L -c "%A" "$dir")
# Check if any bits are set that require root to set
if [[ "$perms" =~ \-r ]]; then
chmod o-w,g-rwx "$dir"
fi
fi
done