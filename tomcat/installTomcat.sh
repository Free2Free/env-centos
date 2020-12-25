#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/tomcat/tomcat.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/tomcat.tar.gz -C /usr/local

# 配置环境变量
sed -i '/TOMCAT_HOME/d' /etc/profile
echo 'export TOMCAT_HOME=/usr/local/tomcat' >> /etc/profile
echo 'export PATH=${TOMCAT_HOME}/bin:$PATH' >> /etc/profile
source /etc/profile

cat <<EOF> /usr/lib/systemd/system/tomcat.service
[Unit]
Description=Tomcat Server Manager
After=syslog.target network.target

[Service]
Type=forking
PIDFile=/var/run/tomcat.pid
ExecStart=/usr/local/tomcat/bin/startup.sh
ExecReload=/bin/kill -USR2 $MAINPID
ExecStop=/bin/kill -SIGINT $MAINPID

[Install]
WantedBy=multi-user.target
EOF