find / -type f -o -type d | xargs -I {} bash -c 'if [ -d "{}" ]; then find {} -type d | grep -v ^\.; fi; if [ -f "{}" ] && ! [ -x "{}" ]; then echo "Error: {}".';' > /dev/null