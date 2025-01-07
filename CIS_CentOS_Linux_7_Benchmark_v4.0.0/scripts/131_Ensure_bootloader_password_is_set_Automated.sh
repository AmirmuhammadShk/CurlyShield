if [ -x /usr/sbin/grub2-setpassword ]; then
grub2-setpassword "$1" "$1"
fi else
echo "Error: grub2-setpassword is not available."
fi