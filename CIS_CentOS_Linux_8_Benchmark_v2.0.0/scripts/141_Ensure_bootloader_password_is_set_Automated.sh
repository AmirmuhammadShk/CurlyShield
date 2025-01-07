read -p "Enter password: " password
echo "$password" | grub2-setpassword
echo "$password" | grub2-setpassword --retry
find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl '^'\*kernelopts=\*linux\*\*kernel\) {} \; | xargs -I {} bash -c "find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl '^'\*kernelopts=\*linux\*\*kernel)' {} \; | sed 's/.*://' > grub.cfg
find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl '^'\*kernelopts=\*linux\*\*kernel)' {} \; | xargs -I {} bash -c "find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl '^'\*kernelopts=\*linux\*\*kernel)' {} \; | sed 's/.*://'" > grubenv
grub2-mkconfig -o "$(dirname "$(find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl '^'kernelopts=|linux|kernel)' {} \;)"/grub.cfg