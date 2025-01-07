yum install -y audit audit-libs
systemctl start audit
systemctl enable audit
auditctl --load=centos-minimal.rules
echo "Hello World" | auditctl -m exec -t file {/dev/null}