l_pq="dpkg-query -W"
if command -v rpm > /dev/null 2>&1; then
l_pq="rpm -q"
fi
l_pcl="gdm gdm3" # Space separated list of packages to check
for l_pn in $l_pcl; do
$l_pq "$l_pn" > /dev/null 2>&1 && echo "Package: \"$l_pn\" exists on the system - checking configuration" || true
done
if command -v gdm > /dev/null 2>&1; then
l_gdmprofile="gdm"
l_bmessage="'Authorized uses only. All activity may be monitored and reported'"
if [ ! -f "/etc/dconf/profile/$l_gdmprofile" ]; then
echo "Creating profile \"$l_gdmprofile\""
echo -e "user-db:user\nsystem-db:$l_gdmprofile\nfile-db:/usr/share/$l_gdmprofile/greeter-dconf-defaults" > /etc/dconf/profile/$l_gdmprofile
fi
if [ ! -d "/etc/dconf/db/$l_gdmprofile.d/" ]; then
echo "Creating dconf database directory \"/etc/dconf/db/$l_gdmprofile.d/\""
mkdir /etc/dconf/db/$l_gdmprofile.d/
fi
gsettings set org.gnome.login-screen banner-message-enable true || true
if ! grep -q 'banner-message-text=' /etc/dconf/profile/$l_gdmprofile; then
echo "Setting banner message:"
sed -i '/^\s*banner-message-enable/ a\banner-message-text="'$l_bmessage'"' "/etc/dconf/profile/$l_gdmprofile"
fi
dconf update || true
else
echo -e "\n\n - GNOME Desktop Manager isn't installed\n - Recommendation is Not Applicable\n - No remediation required\n" || true
fi