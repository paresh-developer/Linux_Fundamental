cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0–9.]*\)%* id.*/\1/" | awk '{print 100 - $1}' | sed 's/\s//g')
disk=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
mem=$(free | awk '/Mem:/ {printf "%.2f", $3/$2 * 100.0}')
network_in=$(ifstat 1 1 | tail -1 | awk '{ print $1}')
network_out=$(ifstat 1 1 | tail -1 | awk '{ print $2}')
user_count=$(w | awk 'NR==1 {print $4}')
#echo "cpu $cpu, disk $disk, mem $mem"
echo "Usage in % percentage"
echo "CPU         : $cpu"
echo "Disk        : $disk"
echo "Memory      : $mem"
echo "Network Usage in KB/s"
echo "NetworkIn   : $network_in"
echo "NetworkOut  : $network_out"
echo "Logged In Users $user_count"