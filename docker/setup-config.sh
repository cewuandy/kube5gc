#/bin/bash
conf=$(ls /mnt/conf/)
cat /mnt/conf/$conf > /root/free5gc/install/etc/free5gc/$conf
freeDiameter=$(ls /mnt/freeDiameter)
cat /mnt/freeDiameter/$freeDiameter > /root/free5gc/install/etc/free5gc/freeDiameter/$freeDiameter
