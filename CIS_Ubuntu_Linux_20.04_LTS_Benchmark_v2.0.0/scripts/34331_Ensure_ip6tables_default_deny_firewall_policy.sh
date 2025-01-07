if [ $(ip -o s v6) != "none" ]; then
ip6tables -P INPUT DROP
ip6tables -P OUTPUT DROP
ip6tables -P FORWARD DROP
fi