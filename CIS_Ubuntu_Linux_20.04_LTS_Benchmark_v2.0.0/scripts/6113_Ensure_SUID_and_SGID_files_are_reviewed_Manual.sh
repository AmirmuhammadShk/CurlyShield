for file in /etc/suidgid /etc/sudoers /usr/bin/*; do
if [ -f "$file" ]; then
echo "Reviewing $file"
filecheck=$(checkfile "$file")
echo "$file: $filecheck"
fi
done
audit_output=$(audit -- FILE=/var/log/audit.log | grep -q 'SUID' || grep -q 'SGID')
if [ $? -ne 0 ]; then
echo "Error in audit output"
fi