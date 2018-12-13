#!/bin/bash
cat /etc/hostname
for D in ` cat /proc/mounts |grep '/dev/sd'|grep '/vstorage'|awk -F ' ' '{print $2}'`
do
#time: 30.400923 sec; rate: { 12.82856 } sync/s;
echo "$D"
./at_io_iops --fsync --rand -s 4K -q 16 --iops -p 16 -t 30 -u 1G -S --cached -f $D/temp|grep rate|awk -F ' ' '{print $6}'
rm $D/temp* -f
done

