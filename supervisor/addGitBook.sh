#! bin/bash
cat <<EOF >/etc/supervisord.d/gitbook.ini
[program:gitbook]
command=/usr/bin/gitbook serve
umask=002
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
priority=100
EOF
# systemctl restart supervisord

supervisorctl restart gitbook
