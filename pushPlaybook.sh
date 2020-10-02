#! bin/bash
cd /Users/explore/playbook
git add */*.sh -f
git commit -m "first commit"
git push -u origin main
echo '已将最新修改内容提交到GitHub!'
