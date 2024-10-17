#!/bin/bash
cd $(dirname $0)
auth=$(python3.9 /Users/wanghongzhi/PycharmProjects/new_py3/twofactor/jumpserver.py)
echo $auth
pwd
sed -i "" '4s/send.*/send "'$auth'\\n"/g' sshAliyun.sh

if [ -n "$1" ]
then
sed -i "" '4s/send.*/send "'$auth'\\n"/g' ssh-builder.sh
./ssh-builder.sh
fi

./sshAliyun.sh

# cat ssh.ep
# ./ssh.ep


