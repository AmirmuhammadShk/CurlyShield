df -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev \
-type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I '{}' chmod a+t '{}'
df -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '/' -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I '{}' chmod a+t '{}'
if [ $(df -P | grep 'not found' | wc -l) -gt 0 ]; then
echo "df --local option not supported on this system. Using df -P instead."
fi