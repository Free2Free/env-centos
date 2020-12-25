#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/redis/redis.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/redis.tar.gz -C /usr/local

# 配置环境变量
sed -i '/REDIS_HOME/d' /etc/profile
echo 'export REDIS_HOME=/usr/local/redis' >> /etc/profile
echo 'export PATH=${REDIS_HOME}/bin:$PATH' >> /etc/profile


#删除残余日志(.log)和数据库（.rdb）文件
find $REDIS_HOME | grep '.*\.rdb$' | xargs rm -rf

cat <<EOF> /etc/hosts
127.0.0.1   localhost
::1         localhost
192.168.3.171 master
192.168.3.172 slaver
EOF

# mkdir ${REDIS_HOME}/conf
# 向配置文件添加后台启动配置
sed -i '/daemonize yes/d' ${REDIS_HOME}/conf/redis.conf

echo 'daemonize yes' >> ${REDIS_HOME}/conf/redis.conf

cat <<EOF> /usr/lib/systemd/system/redis.service
[Unit]
Description=Redis Server Manager
After=syslog.target network.target

[Service]
Type=forking
PIDFile=/var/run/redis_6379.pid
ExecStart=/usr/local/redis/bin/redis-server /usr/local/redis/conf/redis.conf
ExecReload=/bin/kill -USR2 $MAINPID
ExecStop=/bin/kill -SIGINT $MAINPID

[Install]
WantedBy=multi-user.target
EOF

systemctl enable redis

# 刷新环境变量
source /etc/profile