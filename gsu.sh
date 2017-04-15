#!/usr/bin/expect

# trap sigwinch and pass it to the child we spawned
# solution from https://ubuntuforums.org/showthread.php?t=865420
trap {
  set rows [stty rows]
  set cols [stty columns]
  stty rows $rows columns $cols < $spawn_out(slave,name)
} WINCH

# create a file called password and put your password in it. make sure nobody else can read it.
set pw [read [open "password"] ]

spawn gsu inf124grp08
expect "Password: "
send "$pw"
expect "$ "
send "cd ~\n"
send "pair\n"
interact
