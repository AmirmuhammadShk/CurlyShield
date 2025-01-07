awk -F: '($1!~/(halt|sync|shutdown)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/
&& $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; do
if [ -d "$dir" ]; then
for file in "$dir"/.*; do
if [ ! -h "$file" ] && [ -f "$file" ]; then
fileperm=$(stat -L -c "%A" "$file")
set_perm() {
chmod go-w "$1"
}
if [ "$(echo "$fileperm" | cut -c6)" != "-" ] || [ "$(echo "$fileperm" | cut -c9)" != "-" ]; then
set_perm "$file"
fi
fi
done
fi
done
This rewritten script maintains the same functionality as the original but adheres to best practices for bash scripting, including:
- Properly quoting variables
- Using functions to encapsulate logic
- Avoiding unnecessary conditional checks