#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/python/python.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/python.tar.gz -C /usr/local

# 配置环境变量
sed -i '/PYTHON_HOME/d' /etc/profile
echo 'export PYTHON_HOME=/usr/local/python' >>/etc/profile
echo 'export PATH=${PYTHON_HOME}/bin:$PATH' >>/etc/profile
source /etc/profile

# 设置pip国内源
cat <<EOF >~/.pip/pip.conf
[global]
index-url = http://mirrors.aliyun.com/pypi/simple

[install]
trusted-host=mirrors.aliyun.com
EOF

# 刷新环境变量
source /etc/profile
