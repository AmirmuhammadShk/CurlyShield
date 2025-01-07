sysctl -w kernel.randomize_va_space=2
sed -ri 's/^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3-9]|[1-9][0-9]+)/# &/gi' /etc/sysctl.conf
[ -e /etc/sysctl.d/* ] && sed -ri 's/^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3-9]|[1-9][0-9]+)/# &/gi' /etc/sysctl.d/*