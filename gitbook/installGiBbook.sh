#! bin/bash
mkdir -p /opt/gitbooks
cd /opt/gitbooks
npm install -g gitbook-cli
npm install graceful-fs
gitbook fetch
gitbook init

