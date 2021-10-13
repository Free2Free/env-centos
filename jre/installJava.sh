#! bin/bash
# 原始文件名
oldName='jre-8u301-linux-x64.tar.gz'
# 新文件名
newName='jre.tar.gz'
# 基础目录
baseDir='/usr/local/java'
# if [ ! -f "/usr/local/src/${newName}" ]; then
# wget -q -P /usr/local/src http://cdn.ai-brain.cn/bin/jre/${oldName} -O ${newName}
# fi
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