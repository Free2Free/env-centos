#! bin/bash
cat <<EOF> /etc/supervisord.d/es.ini
[program:es]
command=/usr/local/elasticsearch/bin/elasticsearch
user=es
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