#! bin/bash
cat <<EOF >/etc/supervisord.d/zk.ini
[program:zk]
command=/usr/local/zookeeper/bin/zkServer.sh start-foreground
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
priority=100
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
# systemctl restart supervisord
supervisorctl restart zk
