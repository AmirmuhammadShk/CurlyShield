findmnt -Dkerno fstype,target | awk '$1 ~ /^\s*(nfs|proc|smb)/ {print $2}' |
while read -r l_bfs; do
chmod o-w "$l_bfs"
done
find / \( -path "/run/user/*" -o -path "/proc/*" -o -path "*/containerd/*" -o -path "*/kubelet/pods/*"
-o -path "/sys/kernel/security/apparmor/*" -o -path "/snap/*" -o -path "/sys/fs/cgroup/memory/*"
-o -path "/sys/fs/selinux/*" \) -type d -perm -0002 -print0 |
while read -r l_fname; do
chmod a+t "$l_fname"
done
find / \( -path "/run/user/*" -o -path "/proc/*" -o -path "*/containerd/*" -o -path "*/kubelet/pods/*"
-o -path "/sys/kernel/security/apparmor/*" -o -path "/snap/*" -o -path "/sys/fs/cgroup/memory/*"
-o -path "/sys/fs/selinux/*" \) \( -type f -o -type d \) -perm -0002 -print0 |
while IFS="^" read -r l_fname l_mode; do # Test files in the array
if [ -f "$l_fname" ]; then
echo -e " - File: \"$l_fname\" is mode: \"$l_mode\"\n  - removing write permission on \"${l_fname##*/}\" from \"other\""
fi
if [ -d "$l_fname" ]; then
if [ ! $(( $l_mode & 0220 )) -gt 0 ]; then
echo -e " - Directory: \"$l_fname\" is mode: \"$l_mode\" and doesn't have the sticky bit set\n  - Adding the sticky bit"
fi
fi
done | while read l_fname; do
chmod o-w "$l_fname"
chmod a+t "$l_fname"
done