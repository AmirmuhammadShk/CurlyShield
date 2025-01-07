auth        required      pam_faillock.so preauth silent audit deny=5
unlock_time=900 even_deny_root
auth        [default=die] pam_faillock.so authfail audit deny=5
unlock_time=900 even_deny_root
Note: The ordering of lines in the auth section is crucial for proper functionality.