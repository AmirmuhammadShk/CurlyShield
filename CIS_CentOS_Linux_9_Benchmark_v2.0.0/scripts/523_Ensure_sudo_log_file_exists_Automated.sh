echo "Defaults logfile=/var/log/sudo.log" | visudo -f /etc/sudoers.d/default-sudoers.conf
Note: The original script was trying to edit the `/etc/sudoers` file, but this can be a security risk. Instead, it's recommended to create a new file in `/etc/sudoers.d/` with the correct configuration.
Also, note that `visudo -f <PATH TO FILE>` is not a valid command. The `-f` option should be used with `visudo` itself, like this: `visudo -f /path/to/file`.
The rewritten script uses `echo` to add the desired line to the file, and then pipes the output to `visudo -c` (which prevents editing mode) followed by `-f` and the path to the new file.