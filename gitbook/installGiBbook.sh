#! bin/bash
mkdir -p /opt/gitbooks
cd /opt/gitbooks
npm install -g gitbook-cli
cd /usr/local/nodejs/lib/node_modules/gitbook-cli/node_modules/npm/node_modules
npm install graceful-fs
cd /opt/gitbooks
gitbook fetch
gitbook init

