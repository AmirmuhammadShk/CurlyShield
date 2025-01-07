if [ -f "/path/to/file" ]; then
echo "File exists"
else
echo "File does not exist"
fi
for file in /usr/bin/*; do
if [ -x "$file" ] && ! grep -q "SGID" "$file"; then
echo "Invalid SGID executable: $file"
fi
done