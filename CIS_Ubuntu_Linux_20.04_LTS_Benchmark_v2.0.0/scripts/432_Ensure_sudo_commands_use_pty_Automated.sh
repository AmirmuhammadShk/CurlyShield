defaults use_pty
for file in /etc/sudoers.d/*.; do
if [[ $file != *.~* ]] && [[ ! $file =~ \.* ]]; then
visudo -f $file
fi
done
sort /etc/sudoers.d/*. | while read line; do
visudo -f $(dirname $line)/$(basename $line) <<< "$line"
done