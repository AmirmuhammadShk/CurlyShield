sudo visudo -f /etc/sudoers.d/01_first <<< "Defaults use_pty
Defaults !use_pty"
sudo visudo -f /etc/sudoers.d/10_second <<< "Defaults use_pty"
for file in /etc/sudoers.d/*; do
if [[ $file != *.~ ]] && [[ $file != *.* ]]; then
sudo visudo -f "$file" << EOF
Defaults use_pty
EOF
fi
done