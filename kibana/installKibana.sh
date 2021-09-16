#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/kibana/kibana.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/kibana.tar.gz -C /usr/local

# 配置环境变量
sed -i '/KIBANA_HOME/d' /etc/profile
echo 'export KIBANA_HOME=/usr/local/kibana' >>/etc/profile
echo 'export PATH=${KIBANA_HOME}/sbin:$PATH' >>/etc/profile
source /etc/profile

# 刷新环境变量
source /etc/profile
