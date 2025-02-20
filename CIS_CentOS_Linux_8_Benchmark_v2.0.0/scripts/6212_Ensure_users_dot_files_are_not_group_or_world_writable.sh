get_home_dirs() {
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && \
$7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && \
$7!~/(\/usr)?\/bin\/false(\/)?$/) {
print $6 }' /etc/passwd | while read -r dir; do
echo "$dir"
done
}
remove_excessive_permissions() {
for dir in $(get_home_dirs); do
if [ -d "$dir" ]; then
for file in "$dir"/.*; do
if [ ! -h "$file" ] && [ -f "$file" ]; then
file_perm=$(stat -L -c "%A" "$file")
chmod go-w "$file"
fi
done
fi
done
}
remove_excessive_permissions