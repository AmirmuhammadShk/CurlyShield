echo "Adding noexec option to /tmp partition" >&2
sed -i 's/\/tmp\/// \(.*\)/ \
s/\(.*\)noexec\(.*\)/\1 noexec\2/' /etc/fstab
echo "Remounting /tmp with noexec option"
mount -o remount,noexec /tmp