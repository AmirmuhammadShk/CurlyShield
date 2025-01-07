if [ -x /usr/sbin/nft ]; then
# Implement default DROP policy for base chains with input, forward, and output hooks
echo "nft chain inet filter input { policy drop; }"
echo "nft chain inet filter forward { policy drop; }"
echo "nft chain inet filter output { policy drop; }"
fi