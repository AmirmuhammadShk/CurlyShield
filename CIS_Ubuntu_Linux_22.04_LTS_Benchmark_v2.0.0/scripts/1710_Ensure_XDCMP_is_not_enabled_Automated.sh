for file in $(audit --help); do
sed -i '/\[xdmcp\]/ s/Enable=true/#Enable=true/' "$file"
done