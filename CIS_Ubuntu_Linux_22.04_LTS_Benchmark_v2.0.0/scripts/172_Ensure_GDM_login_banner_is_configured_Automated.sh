if command -v dpkg-query &> /dev/null; then
dpkg_query="dpkg-query -s"
elif command -v rpm &> /dev/null; then
rpm_query="rpm -q"
fi
gdm_packages_to_check="gdm gdm3"
for package in $gdm_packages_to_check; do
if $dpkg_query "$package" &> /dev/null; then
output="$output\n - Package: \"$package\" exists on the system\n - checking configuration"
fi
done
if [ -n "$output" ]; then
gdm_profile="gdm"
banner_message="'Authorized uses only. All activity may be monitored and reported'"
if [ ! -f "/etc/dconf/profile/$gdm_profile" ]; then
echo "Creating profile \"$gdm_profile\""
echo -e "user-db:user\nsystem-db:$gdm_profile\nfile-db:/usr/share/$gdm_profile/greeter-dconf-defaults" > /etc/dconf/profile/$gdm_profile
fi
if [ ! -d "/etc/dconf/db/$gdm_profile.d/" ]; then
echo "Creating dconf database directory \"/etc/dconf/db/$gdm_profile.d/\""
mkdir /etc/dconf/db/$gdm_profile.d/
fi
grep -Piq '^\h*banner-message-enable\h*=\h*true\b' /etc/dconf/db/$gdm_profile.d/* || {
echo "Creating gdm keyfile for machine-wide settings"
output=$(grep -Piq -- '^\h*banner-message-enable\h*=\h*' /etc/dconf/db/$gdm_profile.d/*)
if [ -z "$output" ]; then
banner_keyfile="/etc/dconf/db/$gdm_profile.d/01-banner-message"
echo -e "\n[org/gnome/login-screen]\nbanner-message-enable=true" >> "$banner_keyfile"
else
output=$(grep -Pil -- '^\h*banner-message-enable\h*=\h*' /etc/dconf/db/$gdm_profile.d/*)
! grep -Pq '^\h*\[org\/gnome\/login-screen\]' "$output" && sed -ri '/^\s*banner-message-enable/ i\[org/gnome/login-screen\]' "$output"
! grep -Pq '^\h*banner-message-enable\h*=\h*true\b' "$output" && sed -ri 's/^\s*(banner-message-enable\s*=\s*)(\S+)(\s*.*$)/\1true \3//' "$output"
fi
}
if ! grep -Piq "^\h*banner-message-text=[\'\"]+\S+" /etc/dconf/db/$gdm_profile.d/*; then
sed -ri "/^\s*banner-message-enable/ a\banner-message-text=$banner_message" /etc/dconf/db/$gdm_profile.d/*
fi
dconf update
else
echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n - No remediation required\n"
fi