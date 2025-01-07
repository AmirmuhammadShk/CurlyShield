!#/bin/bash
for ARCH in b32 b64; do
filename="/etc/audit/rules.d/$ARCH-access.rules"
if [ -f "$filename" ]; then
sed -i "s/auid!=4294967295/auid!=0/g" "$filename"
else
echo >> "$filename"
fi
sed -i "/exit=-EACCES/,/exit=-EPERM/ s/-EACCES/-EACCS/g" "$filename"
sed -i "s/-EACCS/-EACC/s" "$filename"
if [ $ARCH -eq 32 ]; then
sed -i "/-EACCES/a
-a always,exit -F arch=$ARCH -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -k access
-a always,exit -F arch=$ARCH -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -k access" "$filename"
else
sed -i "/-EACCES/a
-a always,exit -F arch=$ARCH -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCS -F auid>=500 -k access
-a always,exit -F arch=$ARCH -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -k access" "$filename"
fi
done