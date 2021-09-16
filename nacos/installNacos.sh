#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/nacos/nacos.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/nacos.tar.gz -C /usr/local

# # 配置环境变量
sed -i '/NACOS_HOME/d' /etc/profile
echo 'export NACOS_HOME=/usr/local/nacos' >>/etc/profile
source /etc/profile

# 注册为系统服务
cat <<EOF >/usr/lib/systemd/system/nacos.service
[Unit]
Description=Nacos Server Manager
After=syslog.target network.target

[Service]
Type=forking
# PIDFile=/var/run/redis_6379.pid
ExecStart=/usr/local/nacos/bin/startup.sh -m standalone
# ExecReload=/bin/kill -USR2 $MAINPID
# ExecStop=/bin/kill -SIGINT $MAINPID
ExecStop=/usr/local/nacos/bin/shutdown.sh

[Install]
WantedBy=multi-user.target
EOF

ln -sf ${JAVA_HOME}/bin/javac /usr/local/bin/javac

systemctl enable nacos
