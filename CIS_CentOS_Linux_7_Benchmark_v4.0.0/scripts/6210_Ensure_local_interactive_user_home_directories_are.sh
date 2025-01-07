while IFS= read -r line; do
if [ -z "$line" ]; then
continue
fi
printf '%s\n' "$line"
done < <(awk -v pat="\$(awk -F/ '$NF != "nologin" {print}' /etc/shells | sed -rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|' - )" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd)
while read -r user home; do
if [ ! -d "$home" ]; then
echo "Creating home directory for $user"
mkdir -p "$home"
fi
if [ -n "$(stat -Lc '%U %#a' "$home")" ]; then
owner=$(stat -Lc '%U' "$home")
mode=$(stat -Lc '%a' "$home")
if [[ $mode =~ ^[0-7][0-7] ]]; then
echo "Changing ownership of $home from $owner to $user"
chown "$user" "$home"
fi
if (( $mode & 0777 )); then
echo "Removing excess permissions from $home"
chmod g-w,o-rwx "$home"
fi
else
echo "Home directory for $user doesn't exist, creating..."
mkdir -p "$home"
fi
done < <(awk -F: '$(NF) ~ "nologin" { print $1 " " $(NF-1) }' /etc/passwd)
l_valid_shells="\$(awk -F/ '$NF != \"nologin\" {print}' /etc/shells | sed -rn '/^\//{s,/,\\\\/,g;p}' | paste -s -d '|' - )"
while read -r line; do
if [ -z "$line" ]; then
continue
fi
printf '%s\n' "$line"
done < <(awk -v pat="$l_valid_shells" -F: '$(NF) ~ pat { print $1 " " $(NF-1) }' /etc/passwd)
if (( ${#users[@]} > 10000 )); then
echo "Found more than 10,000 local interactive users"
fi
for user in "${!users[@]}"; do
home=${users[$user]}
if [ -d "$home" ]; then
echo "User: $user Home \"$home\" is owned by: $(stat -Lc '%U' "$home")"
chown "$user" "$home"
fi
done
for user in "${!users[@]}"; do
home=${users[$user]}
if [ -d "$home" ]; then
echo "User: $user Home \"$home\" is mode: $(stat -Lc '%a' "$home") should be mode: $(printf '%o' $(printf '%d' $((0777 & ~(0777 | ~2)))) ) or more restrictive"
chmod g-w,o-rwx "$home"
fi
done
for user in "${!users[@]}"; do
home=${users[$user]}
if [ ! -d "$home" ]; then
echo "User: $user Home \"$home\" doesn't exist, creating..."
mkdir -p "$home"
fi
done