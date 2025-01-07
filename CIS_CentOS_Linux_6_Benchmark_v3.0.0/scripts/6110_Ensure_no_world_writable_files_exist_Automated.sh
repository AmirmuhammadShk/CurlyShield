for filename in *; do
if [ -w "$filename" ]; then
chmod o-w "$filename"
fi
done