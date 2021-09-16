#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/git/git.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/git.tar.gz -C /usr/local

# 配置环境变量
sed -i '/GIT_HOME/d' /etc/profile
echo 'export GIT_HOME=/usr/local/git' >>/etc/profile
echo 'export PATH=${GIT_HOME}/bin:$PATH' >>/etc/profile
source /etc/profile

# 刷新环境变量
source /etc/profile
