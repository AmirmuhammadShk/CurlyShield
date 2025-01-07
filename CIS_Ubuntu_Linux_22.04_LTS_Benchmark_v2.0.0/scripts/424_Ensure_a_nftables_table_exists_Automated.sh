if ! command -v nft &> /dev/null; then
echo "Error: nftables not found"
exit 1
fi
nft create table inet filter