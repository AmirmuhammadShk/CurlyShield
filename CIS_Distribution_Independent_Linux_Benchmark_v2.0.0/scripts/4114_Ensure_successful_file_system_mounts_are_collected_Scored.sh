if [ "$(uname -m)" = "x86_64" ]; then
# For 64 bit systems
auid=500
else
# For 32 bit systems
auid=4294967295
fi
echo " mount -F auid=$auid,arch=${arch}-64 -S mount -k mounts" | auditctl -l -w -t mount -M /etc/audit/rules.d/
echo " mount -F auid=$auid -S mount -k mounts" | auditctl -l -w -t mount -M /etc/audit/rules.d/
echo " mount -F auid=$auid,arch=${arch}-32 -S mount -k mounts" | auditctl -l -w -t mount -M /etc/audit/rules.d/