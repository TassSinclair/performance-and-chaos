#!/usr/bin/expect -f
set timeout -1
spawn minikube ssh
expect "\\\$"
send "sudo sysctl -w vm.max_map_count=262144\r"
expect "\\\$"
send "exit\r"
