#! bin/bash

cat <<EOF> /etc/supervisord.d/jenkins.ini
[program:jenkins]
command=/usr/local/jenkins/catalina.sh run
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
priority=100
EOF
# systemctl restart supervisord

supervisorctl restart jenkins