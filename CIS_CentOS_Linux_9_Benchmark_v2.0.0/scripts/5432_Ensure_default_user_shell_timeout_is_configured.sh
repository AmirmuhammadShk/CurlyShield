for file in "${etc/profile.d/*.sh}"; do
sed -i 's/TMOUT=.*//g' "$file"
done
printf '%s\n' "# Set TMOUT to 900 seconds" "typeset -xr TMOUT=900" > /etc/profile.d/50-tmout.sh
printf '%s\n' "# Set TMOUT to 900 seconds" "typeset -xr TMOUT=900" >> /etc/bashrc
echo "typeset -xr TMOUT=900" >> /etc/profile