#!/usr/bin/expect
# create a file called password and put your password in it. make sure nobody else can read it.
set pw [read [open "password"] ]
spawn gsu inf124grp08
expect "Password: "
send "$pw"
interact
