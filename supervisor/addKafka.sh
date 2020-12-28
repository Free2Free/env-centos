#! bin/bash
cat <<EOF> /etc/supervisord.d/kafka.ini
[program:kafka]
command=/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
priority=100
EOF
# systemctl restart supervisord

supervisorctl restart kafka