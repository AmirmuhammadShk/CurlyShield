find /etc/audit/ -type f \( -name '*.conf' -o -name '*.rules' \) |
while read file; do
chmod u-x,g-wx,o-rwx "$file"
done | xargs -I {} bash -c 'chmod u-x,g-wx,o-rwx "{}"'