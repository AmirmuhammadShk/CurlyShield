sysctl -w kernel.randomize_va_space=2
for file in /etc/sysctl.d/*.conf; do
echo "Loading sysctl configuration file $file..."
if ! echo "$file" | grep -q "^#"; then
echo "$file"
fi
done