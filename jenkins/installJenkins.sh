#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/jenkins/jenkins.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/jenkins.tar.gz -C /usr/local

mkdir -p ~/.jenkins/workspace
# 授权目录具有可执行权限
chmod 755 ~/.jenkins/workspace
