if grep -q '\*:/' /etc/passwd; then
sed -e 's/^\([a-zA-Z0-9_]*\):[^:]*:/\1:x:/' -i /etc/passwd
fi
grep -r 'logged in' /var/log/* | grep -q "$USER" && echo "Forced to close $USER";