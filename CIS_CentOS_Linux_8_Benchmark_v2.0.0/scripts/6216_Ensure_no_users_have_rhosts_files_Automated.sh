awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ &&
$7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {
print $6 }' /etc/passwd | while read -r dir; do
if [ -d "$dir" ]; then
file="$dir/.rhosts"
[ ! -h "$file" ] && [ -f "$file" ] && rm -rf "$file"
fi
done