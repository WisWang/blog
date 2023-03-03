#!/bin/bash
cd $(dirname $0)
auth=$(python3 /Users/wanghongzhi/PycharmProjects/new_py3/twofactor/jumpserver.py)
echo $auth
pwd
sed -i "" '4s/send.*/send "'$auth'\\n"/g' sshAliyun.sh
./sshAliyun.sh

# cat ssh.ep
# ./ssh.ep


