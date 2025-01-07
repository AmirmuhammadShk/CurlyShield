[Time]
NTP=time.nist.gov
FallbackNPT=time-a-g.nist.gov time-b-g.nist.gov time-c-g.nist.gov
{ [ ! -d /etc/systemd/timesyncd.conf.d/ ] && mkdir /etc/systemd/timesyncd.conf.d/; printf '%s\n' "[Time]" "NTP=time.nist.gov" "FallbackNPT=time-a-g.nist.gov time-b-g.nist.gov time-c-g.nist.gov" >> /etc/systemd/timesyncd.conf.d/60-timesyncd.conf; }