sysctl -w kernel.yama.ptrace_scope=1
printf '%s\n' "kernel.yama.ptrace_scope = 1" >> /etc/sysctl.d/60-kernel_sysctl.conf