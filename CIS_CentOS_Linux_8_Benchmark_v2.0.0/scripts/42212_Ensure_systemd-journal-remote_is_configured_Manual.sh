sed -i 's#URL=.*#URL=192.168.50.42#' /etc/systemd/journal-upload.conf
sed -i 's#ServerKeyFile=.*#ServerKeyFile=/etc/ssl/private/journal-upload.pem#' /etc/systemd/journal-upload.conf
sed -i 's#ServerCertificateFile=.*#ServerCertificateFile=/etc/ssl/certs/journal-upload.pem#' /etc/systemd/journal-upload.conf
sed -i 's#TrustedCertificateFile=.*#TrustedCertificateFile=/etc/ssl/ca/trusted.pem#' /etc/systemd/journal-upload.conf
systemctl restart systemd-journal-upload