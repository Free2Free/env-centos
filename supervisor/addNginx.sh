#! bin/bash
cat <<EOF> /etc/supervisord.d/nginx.ini
[program:nginx]
command=/usr/local/nginx/sbin/nginx -g 'daemon off;'
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
stdout_logfile=/usr/local/nginx/logs/access.log
stderr_logfile=/usr/local/nginx/logs/error.log
EOF

# systemctl restart supervisord
# 关闭Nginx服务开机自启，避免与supervisor服务冲突
systemctl disable nginx
supervisorctl restart nginx