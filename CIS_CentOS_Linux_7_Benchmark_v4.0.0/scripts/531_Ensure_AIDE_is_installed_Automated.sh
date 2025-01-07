if ! yum install -y aide; then
echo "Error: AIDE is not installed"
fi
aide --init
mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
echo "AIDE installation completed"