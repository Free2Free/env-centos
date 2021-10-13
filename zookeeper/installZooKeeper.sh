#! bin/bash
# 原始文件名
oldName='apache-zookeeper-3.7.0-bin.tar.gz'
# 新文件名
newName='zookeeper.tar.gz'
# 基础目录
baseDir='/usr/local/zookeeper'
wget -q -P /usr/local/src -N http://cdn.ai-brain.cn/bin/zookeeper/${oldName} -O ${newName}

# 清空基础目录
rm -rf ${baseDir}
mkdir -p ${baseDir}
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/${newName} -C ${baseDir} --strip-components 1

# 配置环境变量
sed -i '/ZK_HOME/d' /etc/profile
echo 'export ZK_HOME='${baseDir} >>/etc/profile
echo 'export PATH=${ZK_HOME}/bin:$PATH' >>/etc/profile

# 刷新环境变量
source /etc/profile

