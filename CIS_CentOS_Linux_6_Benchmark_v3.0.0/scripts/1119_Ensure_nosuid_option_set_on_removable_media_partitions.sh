sed -i '/^/d' /etc/fstab  # Delete lines starting with /
grep -E ' floppy|cdrom' /etc/fstab | while read line; do
# Add nosuid option to the fourth field of each match
echo "${line%% *}" | sed 's/.*\(nosuid\)/\1 nosuid/'
done
sudo mount -a