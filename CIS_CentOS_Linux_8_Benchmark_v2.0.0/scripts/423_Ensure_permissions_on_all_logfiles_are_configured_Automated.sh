find /var/log/ -type f -exec chmod --changes g-wx,o-rwx {} \;
audit_command=$(find /var/log/ -type f -perm /g+wx,o+rwx | xargs -I % echo "{}" | sudo find /var/log/ -type f -exec chmod --changes g-wx,o-rwx {} \;)
if [ $? -ne 0 ]; then
echo "Audit procedure failed: $audit_command"
fi