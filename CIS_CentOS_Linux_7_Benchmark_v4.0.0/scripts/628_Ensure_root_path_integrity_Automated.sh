if [ -d . ]; then echo "Error: Current working directory is a directory"; fi
if [ -d .. ]; then echo "Error: Parent directory path is not valid"; fi
if [ -z "$(ls -A)" ]; then echo "Warning: Empty directory found"; else ls -A; fi
if [ -d / ]; then echo "Warning: Trailing slash in root directory"; fi
if [ "$(id -u)" != "0" ] || [ ! -d "/home/user" ]; then echo "Error: Directory not owned by root or not located in /home/user"; else ls -l; fi
if [ ! -r /home/user ]; then echo "Error: File permission is less than 0755"; else echo "/home/user has valid file permissions"; fi