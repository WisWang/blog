#!/usr/bin/expect
spawn ssh relay
expect "Verification code: "
send "189382\n"
interact

