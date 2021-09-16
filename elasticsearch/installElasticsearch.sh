#! bin/bash
source /etc/profile
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/elasticsearch/elasticsearch.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/elasticsearch.tar.gz -C /usr/local

# 用主机名做节点名称
grep "^node.name" /usr/local/elasticsearch/config/elasticsearch.yml
if (($? > 0)); then
  echo 'node.name: ${HOSTNAME}' >>/usr/local/elasticsearch/config/elasticsearch.yml
fi

# 配置环境变量
sed -i '/ES_HOME/d' /etc/profile
echo 'export ES_HOME=/usr/local/elasticsearch' >>/etc/profile
echo 'export PATH=${ES_HOME}/bin:$PATH' >>/etc/profile

# 刷新环境变量
source /etc/profile

sed -i '/vm.max_map_count/d' /etc/sysctl.conf
echo "vm.max_map_count=262144" >>/etc/sysctl.conf
sysctl -p

cat <<EOF >/etc/security/limits.conf
* soft nofile 65536
* hard nofile 65536
EOF
sysctl -p

# 创建ES专属用户(此语句可重复执行)
useradd -g root es
echo "es.123.456" | passwd es --stdin
chown -R es:root /usr/local/elasticsearch

# 添加快捷启动脚本
cat <<EOF >${ES_HOME}/bin/startup.sh
/usr/local/elasticsearch/bin/elasticsearch -d
EOF

# 添加快捷关闭脚本
cat <<EOF >${ES_HOME}/bin/shutdown.sh
PID=$(ps -ef | grep elasticsearch | grep -v grep | awk '{ print $2 }')
if [ -z "$PID" ]
then
    echo Application is already stopped
else
    kill -9 $PID
fi
EOF

# 创建快捷软连接
ln -sf ${ES_HOME}/bin/elasticsearch ${ES_HOME}/bin/es

# 刷新环境变量
source /etc/profile
