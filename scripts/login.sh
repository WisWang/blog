#!/bin/bash
cd $(dirname $0)
auth=$(python3 /Users/user/PycharmProjects/new_py3/jumpsever27/google_auth2.py)
echo $auth
pwd
sed -i "" 's/send.*/send "'$auth'\\n"/g' ssh.sh
./ssh.sh

# cat ssh.ep
# ./ssh.ep


