while read line; do
if [[ $line != *"console"* ]]; then
echo "$line"
else
sed -e "/^console/d" <<< "$line" | awk '{print NR}' > /tmp/tempfile.txt
mv /tmp/tempfile.txt /etc/security/secure_console
fi
done < /etc/passwd