#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/nacos/nacos.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/nacos.tar.gz -C /usr/local

# # 配置环境变量
# sed -i '/NACOS_HOME/d' /etc/profile
# echo 'export NACOS_HOME=/usr/local/nacos' >> /etc/profile
# echo 'export PATH=${NACOS_HOME}/bin:$PATH' >> /etc/profile
# source /etc/profile

# 注册为系统服务
