#! bin/bash
# 下载自定义Java安装包
# 原始文件名
oldName='jdk-8u301-linux-x64.tar.gz'
# 新文件名
newName='java.tar.gz'
# 基础目录
baseDir='/usr/local/java'
# 如果文件不存在，则下载
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/jdk/${oldName} -O ${newName}

# 清空基础目录
rm -rf ${baseDir}
mkdir -p ${baseDir}
# 解压文件
tar --no-same-owner -zxvf /usr/local/src/${newName} -C ${baseDir} --strip-components 1

# 配置环境变量
# 现将原来有关配置删除，然后添加，重复执行不会重复添加以下内容
sed -i '/JAVA_HOME/d' /etc/profile
echo 'export JAVA_HOME='${baseDir} >>/etc/profile
echo 'export JRE_HOME=${JAVA_HOME}/jre' >>/etc/profile
echo 'export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib' >>/etc/profile
echo 'export PATH=${JAVA_HOME}/bin:$PATH' >>/etc/profile

# 刷新环境变量
source /etc/profile
# 输出Java版本
java -version
