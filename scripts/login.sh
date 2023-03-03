#!/bin/bash
cd $(dirname $0)
auth=$(python3 /Users/wanghongzhi/PycharmProjects/new_py3/twofactor/relay.py)
echo $auth
pwd
sed -i "" 's/send.*/send "'$auth'\\n"/g' ssh.sh
./ssh.sh

# cat ssh.ep
# ./ssh.ep


