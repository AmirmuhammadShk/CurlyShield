edit_sysconfig() {
local file_path="/etc/sysconfig/init"
local prompt_value="no"
# Check if the file exists
if [ -f "$file_path" ]; then
sed -i 's/PROMPT=.*/PROMPT='"$prompt_value"'/g' "$file_path"
else
echo "Error: File not found: $file_path"
fi
}
edit_sysconfig