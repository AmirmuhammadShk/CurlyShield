find_legacy_entries() {
while IFS= read -r line; do
if [[ "$line" =~ ^\+.* ]]; then
echo "Legacy '+' entry found: $line"
fi
done < /etc/shadow
}
remove_legacy_entries() {
sed -i '/^$/d' /etc/shadow
}
if [ -n "$(find_legacy_entries)" ]; then
remove_legacy_entries
fi