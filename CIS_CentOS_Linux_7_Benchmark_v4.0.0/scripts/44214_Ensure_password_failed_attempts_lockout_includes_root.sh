auth        required      pam_faillock.so preauth silent audit deny=5
unlock_time=900 even_deny_root
auth        [default=die] pam_faillock.so authfail audit deny=5
unlock_time=900 even_deny_root
auth    requisite   pam_unix.so try_first_pass
auth    [default=die]  pam_faillock.so authfail audit deny=5
unlock_time=900 even_deny_root
auth     sufficient pam_succeed_if.so uid >= 1000 quiet_success
auth      required  pam_env.so
auth      required  pam_deny.so