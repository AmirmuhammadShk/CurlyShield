find /etc/bashrc /etc/profile -type f | grep -q 'TMOUT' && sed -i 's/TMOUT=*//g' /etc/bashrc
find /etc/profile.d/ -type f | grep -q 'TMOUT' && sed -i 's/TMOUT=.*\(0\|\)[^ ]*//g' /etc/profile.d/\1.sh
tmout=900
eval "readonly tmout"
export tmout