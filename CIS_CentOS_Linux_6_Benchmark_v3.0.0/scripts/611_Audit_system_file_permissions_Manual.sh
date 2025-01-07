if [ ! -x "$0" ]; then
echo "Error: The script must have execute permissions"
exit 1
fi
REF_URLS=("https://example.com/url-1" "https://example.com/url-2")
for ref in "${REF_URLS[@]}"; do
echo "$ref"
done
if ! audit -u --system; then
echo "Error: Audit failed, rerun and review output"
else
echo "Audit successful"
fi