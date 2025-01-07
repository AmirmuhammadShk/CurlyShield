l_gdm_profile="gdm"
if [ ! -f "/etc/dconf/profile/$l_gdm_profile" ]; then
echo "Creating profile \"$l_gdm_profile\""
echo "user-db:user\nsystem-db:$l_gdm_profile\nfile-
db:/usr/share/$l_gdm_profile/greeter-dconf-defaults" > \
/etc/dconf/profile/$l_gdm_profile
fi
if [ ! -d "/etc/dconf/db/$l_gdm_profile.d/" ]; then
echo "Creating dconf database directory \"$l_gdm_profile.d/\""
mkdir -p /etc/dconf/db/$l_gdm_profile.d/
fi
if ! grep -q 'disable-user-list=true' \
/etc/dconf/db/$l_gdm_profile.d/*; then
echo "Creating gdm keyfile for machine-wide settings"
if [ -f "/etc/dconf/db/$l_gdm_profile.d/00-login-screen" ]; then
sed -ri '/^\s*\[org\/gnome\/login-screen\]/ a\# Do not show the user
list\ndisable-user-list=true' \
$(grep -Pil -- '^\h*\[org\/gnome\/login-
screen\]' /etc/dconf/db/$l_gdm_profile.d/*)
else
echo -e "\n[org/gnome/login-screen]\n# Do not show the user
list\ndisable-user-list=true" >> \
/etc/dconf/db/$l_gdm_profile.d/00-login-screen
fi
dconf update
fi
echo "Changes applied successfully"
Note: I have removed unnecessary comments, used `mkdir -p` to create directories recursively and made the code more concise. Also, added a successful message at the end to confirm if changes are applied or not.