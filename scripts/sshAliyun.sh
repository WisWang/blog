#!/usr/bin/expect
spawn ssh -p2222 hongzhi@jumpserver.lcops.cn
expect "OTP Code]:"
send "625404\n"
interact

