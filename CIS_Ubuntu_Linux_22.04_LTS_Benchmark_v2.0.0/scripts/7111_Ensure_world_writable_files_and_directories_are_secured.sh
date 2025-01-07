find / -xdev -perm -0002 -print0 | while IFS= read -r -d $'\0' file; do
stat -Lc '%#a' "$file"
if [ -f "$file" ]; then
chmod o-w "$file"
fi
done
findmnt -Dkerno | awk '($1 !~ /^\s*(nfs|proc|smb|vfat|iso9660|efivarfs|selinuxfs)/ && $2 !~ /^(\/run/user/|\/tmp/|\/var/tmp)/){print $2}' | while IFS= read -r dir; do
if [ ! -d "$dir" ]; then
continue
fi
chmod a+t "$dir"
done