#!/usr/bin/expect
spawn ssh -p2222 wis.w@ssh.wis.com
expect "]: "
send "938285\n"
interact

