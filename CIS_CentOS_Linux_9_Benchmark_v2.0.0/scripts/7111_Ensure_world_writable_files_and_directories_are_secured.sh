{
l_smask='01000'
a_file=(); a_dir=()
a_path=( /proc /sys )
while IFS= read -r l_mount; do
if [ ! "$l_mount" = "/" ]; then
find "$l_mount" -xdev \( "${a_path[@]}" \) \( -type f -o -type d \) -perm -0002 -print0 2> /dev/null | while IFS= read -r l_file; do
chmod o-w "$l_file"
stat -Lc '%#a' "$l_file" || true
done
fi
done < <(findmnt -Dkerno fstype,target | awk '($1 !~ /^(nfs|proc|smb|vfat|iso9660|efivarfs|selinuxfs)/ && $2 !~ /(\/run\/user\/|\/tmp|\/var\/tmp)/){print $2}')
}