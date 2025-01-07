while read -r l_user l_home; do
if [ -d "$l_home" ]; then
echo -e "\n - Checking user: \"$l_user\" home directory: \"$l_home\"\n"
for hdfile in "$l_home"/*; do
if [[ ! $hdfile =~ (^|/).\+ ]]; then
# Change ownership to user's primary group
chown "$l_user:$l_user" "$hdfile"
# List .forward and .rhost files for investigation and manual deletion
while read -r l_mode l_owner l_gowner; do
case "$(basename "$hdfile")" in
.forward | .rhost )
echo -e "  - File: \"$hdfile\" exists\n   - Please investigate and manually delete \"$hdfile\"\n"
;;
.netrc | .bash_history )
# Fix file access permissions
chmod u-x,g-rwx "$hdfile" || echo "Failed to fix permissions for $hdfile"
;;
esac
done < <(stat -Lc '%#a %U %G' "$hdfile")
fi
done
fi
done <<< "$(awk -v pat="^nologin$" -F: '$1 ~ pat { print $1 " " $2 }' /etc/passwd)"
if [ $(wc -l < /etc/shells) -gt 1000 ]; then
echo -e "\n  ** INFO **\n  - \"$$( wc -l < /etc/shells )\" Local interactive users found on the system\n  - This may be a long running check\n"
fi
{
# Initialize array to store user-home pairs
unset a_uarr;
a_uarr=()
while read -r l_user l_home; do
if [ -n "$l_user" ] && [ -d "$l_home" ]; then
a_uarr+=("$l_user $l_home")
fi
done < <(awk -v pat="^$(awk -F/ '$NF != "nologin"" {print}' /etc/shells | sed -rn 's,/,\\\,,g;p)' -F: '$1 ~ pat { print $1 " " $2 }' /etc/passwd)
# Check if there are more than 1000 local interactive users
l_asize=${#a_uarr[@]}
[ $l_asize -gt 1000 ] && echo -e "\n  ** INFO **\n  - \"$l_asize\" Local interactive users found on the system\n  - This may be a long running check\n"
# Fix file access permissions
for l_user in "${a_uarr[@]}"; do
read -r user home <<< "$l_user"
if [ -d "$home" ]; then
for hdfile in "$home"/*; do
if [[ ! $hdfile =~ (^|/).\+ ]]; then
# Change ownership to user's primary group
chown "$user:$user" "$hdfile"
# List .forward and .rhost files for investigation and manual deletion
while read -r l_mode l_owner l_gowner; do
case "$(basename "$hdfile")" in
.forward | .rhost )
echo -e "  - File: \"$hdfile\" exists\n   - Please investigate and manually delete \"$hdfile\"\n"
;;
.netrc | .bash_history )
# Fix file access permissions
chmod u-x,g-rwx "$hdfile" || echo "Failed to fix permissions for $hdfile"
;;
esac
done < <(stat -Lc '%#a %U %G' "$hdfile")
fi
done
fi
done
# Remove array after use
unset a_uarr
}