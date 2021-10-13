#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/nginx/nginx-compress.tar.gz
# 基础目录
baseDir='/usr/local/nginx'
# 清空基础目录
rm -rf ${baseDir}
mkdir -p ${baseDir}
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/nginx-compress.tar.gz -C ${baseDir} --strip-components 1

# 配置环境变量
sed -i '/NGINX_HOME/d' /etc/profile
echo 'export NGINX_HOME=/usr/local/nginx' >>/etc/profile
echo 'export PATH=${NGINX_HOME}/sbin:$PATH' >>/etc/profile

# 刷新环境变量
source /etc/profile
