#! bin/bash

if [ ! -d "/usr/local/jenkins" ];then
mkdir -p /usr/local/jenkins
fi

wget -P /usr/local/jenkins -N http://cdn.ai-brain.cn/bin/jenkins/jenkins.war

cat <<EOF> /etc/supervisord.d/jenkins.ini
[program:jenkins]
command=/usr/local/java/bin/java -jar /usr/local/jenkins/jenkins.war --httpPort=2222
autostart=true
autorestart=true
startsecs=8
startretries=3
redirect_stderr=true
priority=100
EOF
# systemctl restart supervisord

supervisorctl restart jenkins