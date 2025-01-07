l_pkgoutput=""
if command -v dpkg-query > /dev/null 2>&1; then
l_pq="dpkg-query -W"
elif command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space separated list of packages to check
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && l_pkgoutput="$l_pkgoutput\n - Package: \"$l_pn\" exists on the system\n - checking configuration"
done
if [ -n "$l_pkgoutput" ]; then
l_gdmprofile="gdm" # Set this to desired profile name IaW Local site policy
l_bmessage="'Authorized uses only. All activity may be monitored and reported'" # Set to desired banner message
if ! grep -q 'banner-message-enable=true' /etc/dconf/db/$l_gdmprofile.d/*; then
echo "Creating gdm keyfile for machine-wide settings"
echo -e "\n[org/gnome/login-screen]\nbanner-message-enable=true" > /etc/dconf/db/$l_gdmprofile.d/01-banner-message
fi
if ! grep -q 'banner-message-text=' "$l_bmessage"; then
sed -ri "/^\s*banner-message-enable/a\banner-message-text=$l_bmessage" /etc/dconf/db/$l_gdmprofile.d/01-banner-message
fi
dconf update
else
echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n - No remediation required\n"
fi