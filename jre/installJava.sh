#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/jre/jre.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/jre.tar.gz -C /usr/local
mv -f /usr/local/jre /usr/local/java

# 配置环境变量
# 现将原来有关配置删除，然后添加，重复执行不会重复添加以下内容
sed -i '/JAVA_HOME/d' /etc/profile
echo 'export JAVA_HOME=/usr/local/java' >> /etc/profile
echo 'export JRE_HOME=${JAVA_HOME}/jre' >> /etc/profile
echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >> /etc/profile
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >> /etc/profile

# 刷新环境变量
source /etc/profile