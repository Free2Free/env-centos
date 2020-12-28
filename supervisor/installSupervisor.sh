#! bin/bash
yum install -y epel-release
yum install -y supervisor

# 备份配置文件，新增个性化配置（无配置则使用默认配置）
if [ ! -f "/etc/supervisord.example.conf" ];then
mv -fu /etc/supervisord.conf /etc/supervisord.example.conf
fi

cat <<EOF> /etc/supervisord.conf
[unix_http_server]
file=/var/run/supervisor/supervisor.sock

[inet_http_server]
port=0.0.0.0:11911
username=root
password=root

[supervisord]
logfile=/var/log/supervisor/supervisord.log
logfile_maxbytes=50MB
logfile_backups=10
loglevel=info
pidfile=/var/run/supervisord.pid
nodaemon=false
minfds=65535
minprocs=4096

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisor/supervisor.sock

[include]
files = supervisord.d/*.ini
EOF

# 设置开机自启
systemctl enable supervisord