#!/bin/bash
# 对 IP_LIST 里的每个IP Ping 尝试 3 次, 如果Ping成功，则继续操作下一个IP;
ping_success_status(){
    if ping -c 1 $IP > /dev/null; then
        echo "$IP Ping is successful."
        continue
    fi
}
IP_LIST="168.1.3.4 10.64.1.129 10.3.2.3"
for IP in $IP_LIST;do
    ping_success_status
    ping_success_status
    ping_success_status
    echo "$IP Ping is failure!"
done
