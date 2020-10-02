#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/redis/redis.tar.gz
# 解压文件
tar -zxvf /usr/local/src/redis.tar.gz -C /usr/local

# 配置环境变量
echo 'export REDIS_HOME=/usr/local/redis' >> /etc/profile
echo 'export PATH=${REDIS_HOME}/bin:$PATH' >> /etc/profile

source /etc/profile