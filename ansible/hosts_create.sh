#!/bin/bash
file="hosts.ini"
echo "[virtuozzo7]" > $file
while true; do
echo "Add ip:"
read ip
if [ "$ip" == "" ] ;then
    break
fi
#ip4=$(echo $ip|awk -F '.' '{print $4}')
ip4=$ip
echo "node${ip4} ansible_ssh_host=10.31.0.$ip cluster_vlan_network=\"{'vlan_id1':'31','vlan_id2':'11','address':'192.168.1.${ip4}','prefix':'24'}\" host_lic=\"RVZ.30004147.0002.txt\"" >> $file
done
echo "" >> $file
echo "[virtuozzo7:vars]" >> $file
echo "ntp_server=10.31.0.1" >> $file
echo "my_cluster_name=SD" >> $file
echo "my_cluster_network=192.168.1.0/255.255.255.0" >> $file
echo "my_mds_index=ssd1" >> $file
echo "my_ssd_cache=ssd0" >> $file
echo "Summ hdd:"
read hdd
let "hdd=hdd-1"
for i in $(seq 0 $hdd);do
    echo "i="$i
    if [ "$i" -lt $hdd ] ;then
	hdd_list=${hdd_list}"'hdd${i}':'ssd0',"
    else
	hdd_list=${hdd_list}"'hdd${i}':'ssd0'"	
    fi
done
echo "my_drive_mapping=\"{$hdd_list}\"" >> $file
echo "my_vstorage_lic=\"PCSS.30004148.0002.txt\"" >> $file
echo "my_test1=\"vstorage_test.sh\"" >> $file
echo "my_test1_io=\"at_io_iops\"" >> $file
echo "my_test2=\"cat.sh\"" >> $file
echo "my_test3=\"iperf\"" >> $file
echo "my_test3_c=\"iperfc.sh\"" >> $file
echo "my_test3_s=\"iperfs.sh\"" >> $file
echo "my_test4=\"mem.sh\"" >> $file
#:%s/cd5201-VDI14/cd5201-VDI15/g
