echo "kernel.yama.ptrace_scope = 1" >> /etc/sysctl.d/60-
sysctl -w kernel.yama.ptrace_scope=1