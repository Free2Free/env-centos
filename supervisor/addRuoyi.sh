#! bin/bash
cat <<EOF> /etc/supervisord.d/ruoyi-auth.ini
[program:ruoyi-auth]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms256m -Xmx512m -jar ruoyi-auth/target/ruoyi-auth-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
supervisorctl restart ruoyi-auth


cat <<EOF> /etc/supervisord.d/ruoyi-gateway.ini
[program:ruoyi-gateway]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms256m -Xmx512m -jar ruoyi-gateway/target/ruoyi-gateway-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
supervisorctl restart ruoyi-gateway



cat <<EOF> /etc/supervisord.d/ruoyi-system.ini
[program:ruoyi-system]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms256m -Xmx512m -jar ruoyi-modules/ruoyi-system/target/ruoyi-modules-system-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
supervisorctl restart ruoyi-system


