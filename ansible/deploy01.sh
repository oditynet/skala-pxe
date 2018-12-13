#!/bin/bash
err=0
for i in `cat hosts.ini|grep ssh_host|grep -v ^#|grep -o '10.31.0.[0-9]\{1,3\}'`
do
ping -w 2 $i 1> /dev/null
if [ "$?" = 0 ]
then
    echo $i "good"
else
    echo $i "bad"
    err=$((err+1))
fi
done
#echo $err
if [ "$err" = 0 ]
then
#    exec ansible-playbook -i hosts.ini deploy02.yml
PS3='Enter your choice:'
opt=("deploy2" "deploy3" "deploy3-copy" "deploy4" "deploy5" "deploy6" "test1" "test2" "test2-stop")
select o in "${opt[@]}"
do
    case $o in
	"deploy2")
	     exec ansible-playbook -i hosts.ini deploy02.yml
	    ;;
	"deploy3")
	    exec ansible-playbook -i hosts.ini deploy03.yml
	    ;;
	"deploy3-copy")
	    exec ansible-playbook -i hosts.ini deploy03-copy.yml
	    ;;
	"deploy4")
	    exec ansible-playbook -i hosts.ini deploy04.yml
	    ;;
	"deploy5")
	    exic ansible-playbook -i hosts.ini deploy05.yml
	    ;;
	"deploy6")
	    exec ansible-playbook -i hosts.ini deploy06.yml
	    ;;    
	"test1")
	    exec ansible-playbook -i hosts.ini deploy-test01.yml
	    ;;
	"test2")
	    exec ansible-playbook -i hosts.ini deploy-test02.yml
	    ;;
	"test2-stop")
	    exec ansible-playbook -i hosts.ini deploy-test02-stop.yml
	    ;;
	*) echo invalid option;;
    esac
done
fi