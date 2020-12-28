#! bin/bash
cat <<EOF> /etc/supervisord.d/nacos.ini
[program:nacos]
command=/usr/local/nacos/bin/startup.sh
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
# systemctl restart supervisord
systemctl disable nacos
supervisorctl restart nacos