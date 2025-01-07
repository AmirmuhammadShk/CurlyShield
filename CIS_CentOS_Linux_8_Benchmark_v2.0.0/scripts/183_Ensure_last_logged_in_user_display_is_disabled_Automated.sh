echo "user-db:user" > /etc/dconf/profile/gdm
cat > /etc/dconf/db/gdm.d/00-login-screen <<EOF
[org/gnome/login-screen]
disable-user-list=true
EOF
dconf update