correct_items=$(audit /etc/passwd /etc/group /etc/profiles.conf)
justify_discovered_items() {
if [ -z "$correct_items" ]; then
echo "Error: Incorrect file permissions"
else
echo "Correct items found."
fi
}
rewrite_paths() {
local i
for i in /etc/passwd /etc/group /etc/profiles.conf; do
chattr +i "$i"
done
}
execute_rewrites() {
rewrite_paths
}
execute() {
justify_discovered_items
execute_rewrites
}