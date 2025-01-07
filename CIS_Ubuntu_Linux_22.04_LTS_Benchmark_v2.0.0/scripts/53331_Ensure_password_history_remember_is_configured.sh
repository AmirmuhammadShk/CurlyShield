modified_lines=$(awk '/pam_pwhistory\.so/ {f = 1; next} /-Type:/ { f = 0 } f {{if (/pam_pwhistory\.so/) print FILENAME}}' /usr/share/pam-configs/*)
for file in $modified_lines; do
echo "Edit $file"
# Get current pam_pwhistory line contents
current_line=$(grep -o 'remember=.*' /etc/pam.d/$file | head -n 1)
if [ -z "$current_line" ]; then
echo "Line not found: $file"
else
# Update the remember argument value to a minimum of 24 or more
updated_line=$(echo "$current_line" | sed 's/remember=//; s/.*=//')
if ! grep -q 'remember=' <<<"$updated_line"; then
updated_line="remember=24"
fi
echo "Update $file: $updated_line"
fi
# Update the file with the new pam_pwhistory line
sed -i "/pam_pwhistory\.so/s/.*//; s/pam_pwhistory\.so remember=24 enforce_for_root try_first_pass use_authtok/" /etc/pam.d/$file
# Run pam-auth-update to update all files in the /etc/pam.d/ directory
echo "Run pam-auth-update --enable $file"
done
echo "Run pam-auth-update --enable pwhistory"