auth required pam_faillock.so onerr=fail audit silent deny=5 unlock_time=900
auth sufficient pam_unix.so
auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900
auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900