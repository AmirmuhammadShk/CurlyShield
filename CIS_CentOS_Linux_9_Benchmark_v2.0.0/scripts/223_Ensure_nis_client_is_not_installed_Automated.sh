dnf remove ypbind
If the file contains instructions, I would rewrite them as a bash script. Here is an example of how to convert the instructions into executable bash commands:
if yum install -y nisclient; then
echo "nis client is already installed"
else
# Remove ypbind package
dnf remove ypbind
echo "ypbind package removed"
fi