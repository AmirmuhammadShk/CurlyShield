if [ "$(pwd)" != "/root/path" ]; then
echo "Error: Current working directory is not /root/path"
exit 1
fi
for dir in $(find /root/path -type f); do
if [ ! -d "$dir" ]; then
echo "Warning: $dir is a file, not a directory"
fi
done
for dir in $(find /root/path -type d); do
if [ -z "$(ls -A "$dir")" ]; then
echo "Warning: Empty directory found at $dir"
fi
done
for dir in $(find /root/path -type d); do
if [ -d "/$dir/" ]; then
echo "Warning: Trailing slash found at $dir"
fi
done
chmod 0755 /root/path
if [ -d "/root/path" ] && [ ! "$(stat -c %a "/root/path")" = "755" ]; then
echo "Warning: Mode of /root/path is not 0755"
fi