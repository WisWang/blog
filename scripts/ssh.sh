#!/usr/bin/expect
spawn ssh -p2222 wis.w@ssh.aekbeucw.com
expect "]: "
send "338186\n"
interact

