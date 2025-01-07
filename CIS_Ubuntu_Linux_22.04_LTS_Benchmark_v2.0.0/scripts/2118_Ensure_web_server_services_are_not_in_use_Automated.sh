sudo systemctl stop httpd.socket httpd.service && sudo apt purge httpd
sudo systemctl stop nginx.service && sudo systemctl mask nginx.service