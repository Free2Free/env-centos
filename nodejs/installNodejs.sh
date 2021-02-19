#! bin/bash
# tar压缩文件有丢失，因此采用zip压缩
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/nodejs/nodejs.zip
yum install unzip -y
# 解压文件
unzip -o /usr/local/src/nodejs.zip -d /usr/local
yum remove unzip -y

# 配置环境变量
sed -i '/NODEJS_HOME/d' /etc/profile
echo 'export NODEJS_HOME=/usr/local/nodejs' >> /etc/profile
echo 'export PATH=${NODEJS_HOME}/bin:$PATH' >> /etc/profile
source /etc/profile

# 设置淘宝镜像源
${NODEJS_HOME}/bin/npm config set registry=http://registry.npm.taobao.org -g
# 刷新环境变量
source /etc/profile