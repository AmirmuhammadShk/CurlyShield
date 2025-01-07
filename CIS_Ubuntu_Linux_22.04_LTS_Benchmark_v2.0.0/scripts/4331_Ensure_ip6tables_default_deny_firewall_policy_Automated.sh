if IPv6 is enabled on your system; then
# Implement a default DROP policy
ip6tables -P INPUT -D ACCEPT && ip6tables -P INPUT -A DROP
ip6tables -P OUTPUT -D ACCEPT && ip6tables -P OUTPUT -A DROP
ip6tables -P FORWARD -D ACCEPT && ip6tables -P FORWARD -A DROP
fi