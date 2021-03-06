#!/bin/bash
# 对IP_LIST里的每个IP ping 三次，如果三次都ping不通，则显示ping fail, else 显示 ping success
IP_LIST="192.168.18.1 192.168.1.1 192.168.18.2"

for IP in $IP_LIST;do
    NUM=1
    while [ $NUM -le 3 ];do
        if ping -c 1 $IP > /dev/null;then
            echo "$IP ping is successful."
            break
        else
            FAIL_COUNT[$NUM]=$IP
            let NUM++
        fi
    done
    if [ ${#FAIL_COUNT[*]} -eq 3 ];then
        echo "${FAIL_COUNT[1]} Ping is failure!"
        unset FAIL_COUNT[*]
    fi
done
