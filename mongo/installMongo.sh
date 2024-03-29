#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/mongo/mongo.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/mongo.tar.gz -C /usr/local

# 配置环境变量
sed -i '/MONGO_HOME/d' /etc/profile
echo 'export MONGO_HOME=/usr/local/mongo' >>/etc/profile
echo 'export PATH=${MONGO_HOME}/bin:$PATH' >>/etc/profile
source /etc/profile
