if ! rpm -qa | grep -q "audit"; then
# Install auditd
yum install audit audit-libs
fi
service audit restart
echo "Auditd Installation Verifies successful"
# If you want to run some command on the machine after this line, put your command here.