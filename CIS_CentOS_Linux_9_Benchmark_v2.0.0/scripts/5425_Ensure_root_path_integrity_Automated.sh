update_root_path() {
# Check locations that are not directories
if [ -f /etc/passwd ]; then
echo "Warning: /etc/passwd is a file, not a directory"
fi
# Check empty directories (::)
for dir in /etc/; do
if [ "$(ls -A "$dir")" = "" ]; then
echo "Warning: Empty directory found at $dir"
fi
done
# Check trailing (:) on directories
for dir in */; do
echo "Warning: Trailing slash found at $dir"
done
# Check current working directory (.)
if [ "$(pwd)" != "/" ]; then
echo "Warning: Current working directory is not /"
fi
# Check non-root owned directories
for dir in */; do
if [ "$(id -u "$dir")" != 0 ]; then
echo "Warning: Non-root owned directory found at $dir"
fi
done
# Check directories that are less restrictive than mode 0755
for dir in /*; do
if [ ! -r "$dir" ] || [ ! -w "$dir" ]; then
echo "Warning: Directory $dir is less restrictive than mode 0755"
fi
done
}
update_root_path