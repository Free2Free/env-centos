#! bin/bash
cat <<EOF> /etc/supervisord.d/ruoyi-auth.ini
[program:ruoyi-auth]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms128m -Xmx256m -jar ruoyi-auth/target/ruoyi-auth-2.4.0.jar
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
command=/usr/local/java/bin/java -Xms128m -Xmx256m -jar ruoyi-gateway/target/ruoyi-gateway-2.4.0.jar
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
command=/usr/local/java/bin/java -Xms128m -Xmx256m -jar ruoyi-modules/ruoyi-system/target/ruoyi-modules-system-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
supervisorctl restart ruoyi-system



cat <<EOF> /etc/supervisord.d/ruoyi-visual.ini
[program:ruoyi-visual]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms128m -Xmx256m -jar ruoyi-visual/ruoyi-monitor/target/ruoyi-visual-monitor-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF

supervisorctl restart ruoyi-visual



cat <<EOF> /etc/supervisord.d/ruoyi-job.ini
[program:ruoyi-job]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms128m -Xmx256m -jar ruoyi-modules/ruoyi-job/target/ruoyi-modules-job-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
supervisorctl restart ruoyi-job




cat <<EOF> /etc/supervisord.d/ruoyi-gen.ini
[program:ruoyi-gen]
directory=${RUOYI}
command=/usr/local/java/bin/java -Xms128m -Xmx256m -jar ruoyi-modules/ruoyi-gen/target/ruoyi-modules-gen-2.4.0.jar
autostart=true
autorestart=true
startsecs=5
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
supervisorctl restart ruoyi-gen

# 如果有新增的兄弟子进程加入，使用此命令即可刷新（已启动的不受影响）
supervisorctl update






