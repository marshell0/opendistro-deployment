docker cp /usr/bin/netstat $1:/usr/bin/netstat
docker cp /usr/sbin/ifconfig $1:/usr/sbin/ifconfig
docker cp /usr/sbin/tcpdump $1:/usr/sbin/tcpdump
docker cp /usr/lib64/libpcap.so.1 $1:/usr/lib64/libpcap.so.1
docker cp /usr/lib64/libpcap.so.1.5.3 $1:/usr/lib64
docker cp /usr/sbin/route $1:/usr/sbin/route
docker cp /usr/sbin/ip $1:/usr/sbin/
docker cp /usr/bin/telnet $1:/usr/bin/telnet
docker exec -u root -it $1 echo "tcpdump:x:72:72::/:/sbin/nologin" >> /etc/passwd
docker exec -u root -it $1 echo "tcpdump:x:72:" >> /etc/group
