grep -PH -- '^\h*([^#\n\r]+\h+)?pam_unix\.so\h+([^#\n\r]+\h+)?remember\b' /usr/share/pam-configs/* |
sed -e 's/remember=//g'
pam-auth-update --enable unix