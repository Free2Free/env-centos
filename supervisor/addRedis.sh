#! bin/bash
cat <<EOF> /etc/supervisord.d/redis.ini
[program:redis]
command=/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis.conf --daemonize no
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF

systemctl restart supervisord