if command -v gnome-desktop-manager > /dev/null 2>&1; then
# Determine system's package manager
case "$(command -v dpkg-query)" in
"dpkg-query")
pkgmanager="dpkg-query"
;;
"rpm")
pkgmanager="rpm"
;;
esac
# Check if GDM is installed
for gdm in $pkgmanager; do
echo "$gdm" > /dev/null 2>&1 && echo -e "\n - Package: \"$gdm\" exists on the system\n - remediating configuration if needed"
done
# Check configuration (If applicable)
if [ $? -eq 0 ]; then
# Look for autorun to determine profile in use, needed for remaining tests
autorun_key=$(grep -Psril '^\h*autorun-never\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}')
if [ -d "/etc/dconf/db/$autorun_key.d" ]; then
# Check if key file directory exists, options can't be locked
if grep -Pil '^\h*\/org/gnome\/desktop\/media-handling\/autorun-never\b' /etc/dconf/db/$autorun_key.d; then
echo -e " - \"autorun-never\" is locked in \$(grep -Pril '^\\h*\\/org\\/gnome\\/desktop\\/media-handling\\/autorun-never\\b' /etc/dconf/db/$autorun_key.d)"
else
# Create entry to lock autorun-never
echo " - creating entry to lock \"autorun-never\""
mkdir "/etc/dconf/db/$autorun_key.d/locks" 2>/dev/null || true
echo '/org/gnome/desktop/media-handling/autorun-never' >> "/etc/dconf/db/$autorun_key.d/locks/00-media-autorun"
fi
else
# Check if autorun-never is set
if grep -Pil '^\h*\/org/gnome\/desktop\/media-handling\/autorun-never\b' /etc/dconf/db/*/ | awk -F'/' '{split($(NF-1),a,".");print a[1]}'; then
echo -e " - \"autorun-never\" is set so it cannot be locked\n - Please follow Recommendation \"Ensure GDM autorun-never is enabled\" and follow this Recommendation again"
else
# Set autorun-never to false
echo " - setting autorun-never to false"
echo '/org/gnome/desktop/media-handling/autorun-never' >> "/etc/dconf/db/*.d/locks/00-media-autorun"
fi
fi
# Update dconf database
dconf update
else
echo -e " - GNOME Desktop Manager package is not installed on the system\n - Recommendation is not applicable"
fi
else
echo -e " - GNOME Desktop Manager is not installed on this system. Please install it before proceeding."
fi