#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/kafka/kafka.tar.gz
# 解压文件(解压时文件使用当前用户)
tar --no-same-owner -zxvf /usr/local/src/kafka.tar.gz -C /usr/local

# 配置环境变量
sed -i '/KAFKA_HOME/d' /etc/profile
echo 'export KAFKA_HOME=/usr/local/kafka' >>/etc/profile
echo 'export PATH=${KAFKA_HOME}/bin:$PATH' >>/etc/profile

# 刷新环境变量
source /etc/profile
