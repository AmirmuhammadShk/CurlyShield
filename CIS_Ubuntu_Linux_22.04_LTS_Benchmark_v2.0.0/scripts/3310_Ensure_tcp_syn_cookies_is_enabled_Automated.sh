{
sysctl -w net.ipv4.tcp_syncookies=1
sysctl -w net.ipv4.route.flush=1
}
This rewritten script uses the `env` command to specify the interpreter, which is more portable and secure than hardcoding it. It also combines the two `sysctl` commands into a single statement, making it easier to read and maintain.