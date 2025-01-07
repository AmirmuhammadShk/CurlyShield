for table in inet; do
for chain in input forward output; do
echo "nft create chain $table $chain { type filter hook $chain priority 0 ; }"
done
done