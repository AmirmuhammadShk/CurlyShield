URL="192.168.50.42"
SERVER_KEY_FILE="/etc/ssl/private/journal-upload.pem"
SERVER_CERT_FILE="/etc/ssl/certs/journal-upload.pem"
TRUSTED_CERT_FILE="/etc/ssl/ca/trusted.pem"
sed -i "s/^URL=.*/URL=${URL}/" /etc/systemd/journal-upload.conf
sed -i "s/^ServerKeyFile=.*/ServerKeyFile=${SERVER_KEY_FILE}/" /etc/systemd/journal-upload.conf
sed -i "s/^ServerCertificateFile=.*/ServerCertificateFile=${SERVER_CERT_FILE}/" /etc/systemd/journal-upload.conf
sed -i "s/^TrustedCertificateFile=.*/TrustedCertificateFile=${TRUSTED_CERT_FILE}/" /etc/systemd/journal-upload.conf
systemctl restart systemd-journal-upload