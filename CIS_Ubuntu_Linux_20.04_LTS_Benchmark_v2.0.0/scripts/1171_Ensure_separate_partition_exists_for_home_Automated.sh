if [ -d "/home" ]; then
echo "Separate partition already exists for /home."
else
# Create a custom partition setup and specify a separate partition for /home
diskutil CoreStorage create "Home Partition"
printf "%s %s\n" "/dev/disk0s1SFS" "/home" >> /etc/fstab
echo "Separate partition created for /home."
fi