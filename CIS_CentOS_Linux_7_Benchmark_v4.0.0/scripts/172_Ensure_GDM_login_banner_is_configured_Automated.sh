if command -v dpkg-query > /dev/null 2>&1; then
pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
pq="rpm -q"
fi
pcl=("gdm" "gdm3")
if [ -n "$pq" ]; then
for pn in $pcl; do
if $pq "$pn" > /dev/null 2>&1; then
echo "- Package: \"$pn\" exists on the system"
echo "checking configuration"
fi
done
# Create gdm profile if it doesn't exist
gdmprofile="gdm"
dconf_profile=$(dirname "/etc/dconf/profile")
if [ ! -f "$dconf_profile/$gdmprofile" ]; then
echo "Creating profile \"$gdmprofile\""
echo -e "user-db:user\nsystem-db:$gdmprofile\nfile-db:/usr/share/$gdmprofile/greeter-dconf-defaults" > "$dconf_profile/$gdmprofile"
fi
# Create dconf database directory if it doesn't exist
db_dir=$(dirname "/etc/dconf/db")
if [ ! -d "$db_dir/$gdmprofile.d/" ]; then
echo "Creating dconf database directory \"/etc/dconf/db/$gdmprofile.d/\""
mkdir "$db_dir/$gdmprofile.d/"
fi
# Check if gdm keyfile exists and update banner message if necessary
keyfile=$(dirname "/etc/dconf/db/$gdmprofile.d/")
banner_message_enable=$(grep -Piq "^\h*banner-message-enable\h*=\h*true\b" "$keyfile/*")
if [ -z "$banner_message_enable" ]; then
echo "creating gdm keyfile for machine-wide settings"
grep -q "^\h*banner-message-enable\h*=" "$keyfile/*" || \
echo -e "\n[org/gnome/login-screen]\nbanner-message-enable=true" > "$keyfile/01-banner-message"
fi
# Update banner message if necessary
banner_message=$(grep -Piq "^\h*banner-message-text=[\'\"]+\S+" "$keyfile/01-banner-message")
if [ -z "$banner_message" ]; then
echo -e "\nbanner-message-text=\"$l_bmessage\"" >> "$keyfile/01-banner-message"
fi
dconf update
else
echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n - No remediation required\n"
fi