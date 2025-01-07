sed -e 's/^\([a-zA-Z0-9_]*\):[^:]*:/\1:x:/' -i /etc/passwd
getent passwd | grep <username> > temp.txt
echo "Account $<username> is logged in and being used for:"
cat temp.txt
rm temp.txt