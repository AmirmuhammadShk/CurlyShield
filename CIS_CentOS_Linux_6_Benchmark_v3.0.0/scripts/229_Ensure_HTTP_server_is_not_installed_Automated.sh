sudo yum remove httpd
if [ $? -eq 0 ]; then
echo "HTTP server removed successfully"
else
echo "Failed to remove HTTP server"
fi