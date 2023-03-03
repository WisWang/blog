#!/usr/bin/expect
spawn ssh relay
expect "Verification code: "
send "413411\n"
interact

