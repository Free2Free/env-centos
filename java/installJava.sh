#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/java/java.tar.gz
# 解压文件
tar -zxvf --no-same-owner /usr/local/src/java.tar.gz -C /usr/local

# 配置环境变量
echo 'export JAVA_HOME=/usr/local/java' >> /etc/profile
echo 'export JRE_HOME=${JAVA_HOME}/jre' >> /etc/profile
echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> /etc/profile
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> /etc/profile

source /etc/profile
