#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/rabbitMQ/rabbitMQ.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/rabbitMQ.tar.gz -C /usr/local

# 配置环境变量
sed -i '/RABBITMQ/d' /etc/profile
echo 'export RABBITMQ=/usr/local/rabbitMQ' >> /etc/profile
echo 'export PATH=${RABBITMQ}/bin:$PATH' >> /etc/profile

sed -i '/erlang/d' /etc/profile
echo 'export PATH=/usr/local/erlang/bin:$PATH' >> /etc/profile

# 刷新环境变量
source /etc/profile

# cat <<EOF> /usr/lib/systemd/system/rabbitMQ.service
# [Unit]
# Description=rabbitMQ Server Manager
# After=syslog.target network.target

# [Service]
# Type=forking
# PIDFile=/var/run/redis_6379.pid
# ExecStart=/usr/local/rabbitMQ/bin/rabbitMQ-server /usr/local/rabbitMQ/conf/rabbitMQ.conf
# ExecReload=/bin/kill -USR2 $MAINPID
# ExecStop=/bin/kill -SIGINT $MAINPID

# [Install]
# WantedBy=multi-user.target
# EOF

# systemctl enable redis

