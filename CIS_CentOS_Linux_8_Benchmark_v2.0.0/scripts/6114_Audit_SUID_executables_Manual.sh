for file in $(find / -type f -perm 4755); do
if [ ! -d "$file" ]; then
echo "File $file is not a directory, skipping"
elif [ $(stat -c "%a" "$file") -ne 4755 ]; then
echo "SUID file $file has been modified"
fi
done