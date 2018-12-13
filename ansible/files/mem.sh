#!/bin/bash
m=$(eval free -m | grep Mem|awk -F ' ' '{print $7}')
exec memtester $m 1 
echo $?

