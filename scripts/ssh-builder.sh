#!/usr/bin/expect
spawn ssh -p2222 hongzhi@jumpserver.wis.com
expect "OTP Code]:"
send "085429\n"
expect "Opt>"
send "mojin\r"
interact

