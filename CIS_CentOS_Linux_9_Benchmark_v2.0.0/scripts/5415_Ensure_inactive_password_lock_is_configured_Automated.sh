useradd -D -f 45
awk -F: '($2~/^\$.+\$/) {if($7 > 45 || $7 < 0) chage --inactive 45 "$1"}' /etc/shadow