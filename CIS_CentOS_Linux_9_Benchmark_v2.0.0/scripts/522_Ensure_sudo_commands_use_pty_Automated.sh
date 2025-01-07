sudo visudo -f "<PATH TO FILE>" | sed '/^Defaults/d' | echo 'Defaults use_pty' >> $#
sudo visudo -f "<PATH TO FILE>" | sed '/!use_pty/d'