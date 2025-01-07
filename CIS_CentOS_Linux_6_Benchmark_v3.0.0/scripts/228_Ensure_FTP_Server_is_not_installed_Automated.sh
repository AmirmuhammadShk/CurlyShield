sudo yum remove -y vsftpd
if sudo systemctl is-enabled vsftpd; then
sudo systemctl disable vsftpd
fi
sudo systemctl stop vsftpd
sudo systemctl unload vsftpd
if [ $(which ftp) != "ftp" ]; then
echo "FTP server is already installed"
else
echo "FTP server has been successfully uninstalled"
fi