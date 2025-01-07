while read -r username; do
if grep -q "^$username:" /etc/passwd; then
echo "Duplicate username $username found"
break
fi
done < <(awk '{print $1}' /etc/passwd)
if [ $? -eq 0 ]; then
for ((i=1000; i<=1500; i++)); do
if ! grep -q "^$i:" /etc/passwd; then
useradd -m -u $i user$i
fi
done
fi