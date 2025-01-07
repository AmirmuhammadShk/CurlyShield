if ! getenforce | grep -q "enforcing"; then
echo "SELinux is not enforcing"
fi
setenforce 1
semodule -n
semodule -D
ausecond -r
if ! getenforce | grep -q "enforcing"; then
echo "SELinux is not enforcing"
fi