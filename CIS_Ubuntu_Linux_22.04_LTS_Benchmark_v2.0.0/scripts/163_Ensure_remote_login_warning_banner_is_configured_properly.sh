echo "Authorized users only. All activity may be monitored and reported." > /etc/issue.net
sed -i 's/\m//g' /etc/issue.net
sed -i 's/\r//g'
sed -i 's/\s//g'
sed -i 's/\v//g'
sed -i 's/Ubuntu|Debian|Linux/unknown/g'
or using parameter expansion:
```bash
echo "Authorized users only. All activity may be monitored and reported." > /etc/issue.net
for word in $(cat /etc/issue.net | grep -o '[^[:space:]]\+'); do
if [ "$word" = "\m" ] || [ "$word" = "\r" ] || [ "$word" = "\s" ] || [ "$word" = "\v" ]; then
sed -i "s/$word//g" /etc/issue.net
elif [[ "$word" == *"Ubuntu|Debian|Linux"* ]]; then
sed -i 's/'"$word"'/unknown/g' /etc/issue.net
fi
done
```