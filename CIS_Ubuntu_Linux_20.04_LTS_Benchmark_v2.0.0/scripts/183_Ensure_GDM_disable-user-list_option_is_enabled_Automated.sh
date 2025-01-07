l_gdm_profile="gdm"
if [ ! -f "/etc/dconf/profile/$l_gdm_profile" ]; then
echo "Creating profile \"$l_gdm_profile\""
echo "user-db:user" > /etc/dconf/profile/$l_gdm_profile
echo "system-db:$l_gdm_profile" >> /etc/dconf/profile/$l_gdm_profile
echo "file-database:/usr/share/$l_gdm_profile/greeter-dconf-defaults" >> /etc/dconf/profile/$l_gdm_profile
fi
if [ ! -d "/etc/dconf/db/$l_gdm_profile.d/" ]; then
echo "Creating dconf database directory \"$/etc/dconf/db/$l_gdm_profile.d/\""
mkdir "/etc/dconf/db/$l_gdm_profile.d/"
fi
if ! grep -Piq '^\h*disable-user-list\h*=\h*true\b' /etc/dconf/db/$l_gdm_profile.d/*; then
echo "Creating gdm keyfile for machine-wide settings"
if ! grep -Piq -- '^\h*\[org\/gnome\/login-screen\]' /etc/dconf/db/$l_gdm_profile.d/*; then
echo -e "\n[org/gnome/login-screen]\n# Do not show the user list\ndisable-user-list=true" >> /etc/dconf/db/$l_gdm_profile.d/00-login-screen
else
sed -ri '/^\s*\[org\/gnome\/login-screen\]/ a\# Do not show the user list disable-user-list=true' $(grep -Pil -- '^\h*\[org\/gnome\/login-screen\]' /etc/dconf/db/$l_gdm_profile.d/*)
fi
fi
dconf update