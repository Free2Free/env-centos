#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/python/python.tar.gz
# 解压文件
tar -zxvf /usr/local/src/python.tar.gz -C /usr/local

# 配置环境变量
grep "^export PYTHON_HOME" /etc/profile;
if (( $? > 0 ))
then
	echo 'export PYTHON_HOME=/usr/local/python' >> /etc/profile
	echo 'export PATH=${PYTHON_HOME}/bin:$PATH' >> /etc/profile
	source /etc/profile
fi
