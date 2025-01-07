edit_file() {
local file="/etc/security/faillock.conf"
if [ -f "$file" ]; then
sed -i 's/unlock_time = [0-9]*//g' "$file"
fi
}
edit_file
find_files() {
local dir="/usr/share/pam-configs"
while IFS= read -r file; do
if grep -q "pam_faillock\.so" "$file"; then
sed -i 's/unlock_time=.*/\nunlock_time = 900\n/' "$file"
fi
done < <(find "$dir" -type f)
}
find_files
echo "Set password unlock time to conform to site policy."
edit_file
sed -i 's/unlock_time = [0-9]*//g' /etc/security/faillock.conf