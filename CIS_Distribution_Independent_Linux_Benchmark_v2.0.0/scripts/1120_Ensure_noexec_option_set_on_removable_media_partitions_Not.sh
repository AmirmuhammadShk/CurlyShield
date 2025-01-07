find /etc/fstab -type f -name '*disk*' | while read line; do
# Check if the partition is a floppy or CD/DVD/ROM drive
if [[ $line =~ 'floppy' || $line =~ 'cdrom' ]]; then
# Add noexec option to the mounting options
sed -i "/$line/s/.*$/\1 noexec/" /etc/fstab
fi
done