audit_sgids() {
if ! [ -d /etc/security/ ]; then
echo "SGID directory not found"
return 1
fi
for file in $(find /etc/security/ -type f); do
filename=$(basename "$file")
if [[ $filename == *SGID* ]]; then
sha256sum "$file" | awk '{print $1}' | xargs echo > /dev/null 2>&1 || {
echo "Invalid SGID file: $filename"
return 1
}
fi
done
return 0
}
if ! audit_sgids; then
exit 1
fi