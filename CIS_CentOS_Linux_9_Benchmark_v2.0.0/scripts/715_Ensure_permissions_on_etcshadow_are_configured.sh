chmod 744 /etc/shadow
[[ $(getfacl -R /etc/shadow) == "user::rwk,group::rwk,other::---" ]];