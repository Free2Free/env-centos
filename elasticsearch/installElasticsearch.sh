#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/elasticsearch/elasticsearch.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/elasticsearch.tar.gz -C /usr/local

# 用主机名做节点名称
grep "^node.name" /usr/local/elasticsearch/config/elasticsearch.yml;
if (( $? > 0 ))
then
	echo 'node.name: ${HOSTNAME}' >> /usr/local/elasticsearch/config/elasticsearch.yml
fi

# 配置环境变量
grep "^export ES_HOME" /etc/profile;
if (( $? > 0 ))
then
	echo 'export ES_HOME=/usr/local/elasticsearch' >> /etc/profile
	echo 'export PATH=${ES_HOME}/bin:$PATH' >> /etc/profile
	source /etc/profile
fi
useradd es
chown -R es:es /usr/local/elasticsearch

grep "^vm.max_map_count" /etc/sysctl.conf;
if (( $? > 0 ))
then
	echo "vm.max_map_count=262144" >> /etc/sysctl.conf
	sysctl -p
fi

grep "^* soft nofile" /etc/sysctl.conf;
if (( $? > 0 ))
then
	echo '* soft nofile 65536' > /etc/security/limits.conf
	echo '* hard nofile 65536' > /etc/security/limits.conf
fi

# 创建ES专属用户(此语句可重复执行)
useradd -g root es
echo "es.123.456"| passwd es --stdin
chown -R es:root ${ES_HOME}

# 刷新环境变量
source /etc/profile


