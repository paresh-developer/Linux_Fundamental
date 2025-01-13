#! /bin/bash

echo -e "\n $(date) Checking for update " >> /tmp/job2_paresh.log
info=$(apt update)
info=$(apt upgrade -y)
info=$(do-release-upgrade -c)
info="$info\n$(apt update)"
info="$info\n$(apt upgrade -y)"
#info="$info\n$(do-release-upgrade)"
echo -e "\n $info " >> /tmp/job2_paresh.log
