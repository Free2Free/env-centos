#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/zookeeper/zookeeper.tar.gz
# 解压文件
tar -zxvf /usr/local/src/zookeeper.tar.gz -C /usr/local

# 配置环境变量
grep "^export ZK_HOME" /etc/profile;
if (( $? > 0 ))
then
echo 'export ZK_HOME=/usr/local/zookeeper' >> /etc/profile
echo 'export PATH=${ZK_HOME}/bin:$PATH' >> /etc/profile
source /etc/profile
fi