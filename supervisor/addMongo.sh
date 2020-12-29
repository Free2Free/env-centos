#! bin/bash
cat <<EOF> /etc/supervisord.d/mongo.ini
[program:mongo]
command=/usr/local/mongo/bin/mongod --config=/usr/local/mongo/conf/config.yml
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
priority=100
EOF
# systemctl restart supervisord

supervisorctl restart mongo