#! bin/bash
cat <<EOF >/etc/supervisord.d/kibana.ini
[program:kibana]
command=/usr/local/kibana/bin/kibana -H 0.0.0.0
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
;stdout_logfile=/usr/local/nginx/logs/access.log
;stderr_logfile=/usr/local/nginx/logs/error.log
EOF
# systemctl restart supervisord
systemctl disable kibana
supervisorctl restart kibana
