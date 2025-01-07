echo "Adding rule to /etc/audit/rules.d/99-finalize.rules" >> /var/log/audit.log
cat <<EOF >> /etc/audit/rules.d/99-finalize.rules
-e 2
300 | P a g e
EOF
echo "Updated audit configuration with immutable rules" >> /var/log/audit.log