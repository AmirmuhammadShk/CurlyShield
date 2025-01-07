yum remove ftp
which ftp 2>/dev/null || echo "ftp client removed successfully"
echo "Verify that ftp client is not installed by running the following command:"
echo "ftp -inv"