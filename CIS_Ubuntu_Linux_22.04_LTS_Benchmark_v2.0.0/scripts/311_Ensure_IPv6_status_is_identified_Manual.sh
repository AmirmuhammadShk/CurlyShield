if [ -n "$IPv6_ENABLED" ]; then
enable_ipv6=$IPv6_ENABLED
else
read -p "Enable IPv6? (y/n) " -e response
case $response in
y|Y) enable_ipv6="true";;
n|N) enable_ipv6="false";;
*) echo "Invalid input. Defaulting to false." && enable_ipv6="false";;
esac
fi
if [ "$enable_ipv6" = "true" ]; then
echo "IPv6 is enabled"
else
echo "IPv6 is disabled"
fi