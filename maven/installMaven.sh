#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/maven/maven.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/maven.tar.gz -C /usr/local

# 配置环境变量
sed -i '/MAVEN_HOME/d' /etc/profile
echo 'export MAVEN_HOME=/usr/local/maven' >> /etc/profile
echo 'export PATH=${MAVEN_HOME}/bin:$PATH' >> /etc/profile

# 刷新环境变量
source /etc/profile