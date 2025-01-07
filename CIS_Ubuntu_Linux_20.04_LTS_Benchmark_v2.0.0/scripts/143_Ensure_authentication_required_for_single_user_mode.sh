if [ "$(cat /etc/passwd | grep 'x:*')" == "" ]; then
echo "Password required for single-user mode"
passwd root
fi