#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/maven/maven.tar.gz
# 解压文件
tar -zxvf --no-same-owner /usr/local/src/maven.tar.gz -C /usr/local

# 配置环境变量
echo 'export MAVEN_HOME=/usr/local/maven' >> /etc/profile
echo 'export PATH=${MAVEN_HOME}/bin:$PATH' >> /etc/profile

source /etc/profile