#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/nodejs/nodejs.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/nodejs.tar.gz -C /usr/local

# 配置环境变量
sed -i '/NODEJS_HOME/d' /etc/profile
echo 'export NODEJS_HOME=/usr/local/nodejs' >> /etc/profile
echo 'export PATH=${NODEJS_HOME}/sbin:$PATH' >> /etc/profile
source /etc/profile


# 刷新环境变量
source /etc/profile