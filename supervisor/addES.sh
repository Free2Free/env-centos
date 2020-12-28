#! bin/bash
cat <<EOF> /etc/supervisord.d/es.ini
[program:es]
command=/usr/local/elasticsearch/bin/elasticsearch -Enetwork.host=127.0.0.1
user=es
password=es.123.456
umask=664
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
priority=100
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
# systemctl restart supervisord

supervisorctl restart es