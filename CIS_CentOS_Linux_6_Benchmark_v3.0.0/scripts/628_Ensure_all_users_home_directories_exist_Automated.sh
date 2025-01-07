while read -r user dir; do
if [ ! -d "$dir" ]; then
mkdir -m 755 "$dir"
chown "$user" "$dir"
fi
done < /etc/passwd