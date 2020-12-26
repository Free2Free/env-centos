#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/rabbitMQ/rabbitMQ.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/rabbitMQ.tar.gz -C /usr/local

# 配置环境变量
sed -i '/RABBITMQ/d' /etc/profile
echo 'export RABBITMQ=/usr/local/rabbitmq' >> /etc/profile
echo 'export PATH=${RABBITMQ}/sbin:$PATH' >> /etc/profile

sed -i '/erlang/d' /etc/profile
echo 'export PATH=/usr/local/erlang/bin:$PATH' >> /etc/profile

# ln -sf /usr/local/erlang/bin/erl /usr/local/bin/erl

# 刷新环境变量
source /etc/profile

# 停用图形化界面
rabbitmq-plugins disable rabbitmq_management

# cat <<EOF> /usr/lib/systemd/system/rabbitMQ.service
# [Unit]
# Description=rabbitMQ Server Manager
# After=syslog.target network.target

# [Service]
# ExecStart=/usr/local/rabbitmq/sbin/rabbitmq-server
# ExecStop=/usr/local/rabbitmq/sbin/rabbitmqctl shutdown

# [Install]
# WantedBy=multi-user.target
# EOF

# systemctl enable rabbitMQ

