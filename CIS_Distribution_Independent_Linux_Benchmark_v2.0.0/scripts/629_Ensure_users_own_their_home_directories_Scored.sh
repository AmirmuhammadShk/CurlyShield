for dir in ~*; do
if [ -d "$dir" ]; then
owner=$(getent pass "$dir" | cut -d: -f2)
if [ -z "$owner" ]; then
echo "Warning: Home directory '$dir' is not owned by a user"
continue
fi
chown "$owner:$owner" "$dir"
else
echo "Ignoring non-directory entry: $dir"
fi
done
if [ "$(uname -s)" = "Linux" ]; then
sudo sed -i '/^sbin\/nologin$/s/^/usr\/sbin\//' /etc/passwd
fi