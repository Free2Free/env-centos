#! bin/bash
# 下载自定义Java安装包
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/elasticsearch/elasticsearch.tar.gz
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/elasticsearch.tar.gz -C /usr/local

grep "^node.name" /usr/local/elasticsearch/config/elasticsearch.yml;
if (( $? > 0 ))
then
	echo 'node.name: $HOSTNAME' >> /usr/local/elasticsearch/config/elasticsearch.yml
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
	source /etc/security/limits.conf
fi



# 此部分是在启动集群时使用
# cat <<EOF>> /usr/local/elasticsearch/config/elasticsearch.yml
# cluster.name: es-cluster
# node.master: true
# node.data: true
# discovery.zen.ping.unicast.hosts: ["192.168.199.116", "192.168.199.117","192.168.199.118"]
# discovery.zen.minimum_master_nodes:  2
# EOF