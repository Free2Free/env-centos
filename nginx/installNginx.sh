#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/nginx/nginx.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/nginx.tar.gz -C /usr/local

# 配置环境变量
grep "^export NGINX_HOME" /etc/profile;
if (( $? > 0 ))
then
echo 'export NGINX_HOME=/usr/local/nginx' >> /etc/profile
echo 'export PATH=${NGINX_HOME}/sbin:$PATH' >> /etc/profile
source /etc/profile
fi

# 刷新环境变量
source /etc/profile