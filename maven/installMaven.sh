#! bin/bash
# 原始文件名
oldName='apache-maven-3.8.2-bin.zip'
# 新文件名
newName='maven.zip'
# 基础目录
baseDir='/usr/local/maven'
wget -P /usr/local/src -N http://cdn.ai-brain.cn/bin/maven/${oldName} -O ${newName}
# 清空基础目录
rm -rf ${baseDir}
mkdir -p ${baseDir}
rm -rf /tmp/maven
mkdir -p /tmp/maven
# 解压文件
unzip -d /tmp/maven /usr/local/src/${newName} 
# 移动临时文件夹
mv -f `find /tmp/maven -maxdepth 1` ${baseDir}

# 配置环境变量
sed -i '/MAVEN_HOME/d' /etc/profile
echo 'export MAVEN_HOME='${baseDir} >>/etc/profile
echo 'export PATH=${MAVEN_HOME}/bin:$PATH' >>/etc/profile

# 刷新环境变量
source /etc/profile
mvn --version
