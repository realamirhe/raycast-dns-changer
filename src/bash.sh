echo "${GREEN_solid}\nChoose an option to change your DNS server:${NC}\c"

printf '
1. Shecan             8. 403.online
2. Pro shecan         3. Forti Client
0. Reset DNS          -. Reset DNS
Enter: '

if [[ $# -eq 0 ]]; then
    read var
else
    var="$1"
fi

echo "--------------------------------------------------------------------"

# Shecan
if [ "$var" -eq "1" ]; then
    networksetup -setdnsservers Wi-Fi\  178.22.122.100 185.51.200.2
    echo "✅ ${GREEN}Shecan set as DNS server.${NC} Checking..."
fi

# 403.online
if [ "$var" -eq "8" ]; then
    networksetup -setdnsservers Wi-Fi\  10.202.10.202 10.202.10.102
    echo "✅ ${GREEN}403 online set as DNS server.${NC} Checking..."
fi

if [ "$var" -eq "2" ]; then
    networksetup -setdnsservers Wi-Fi\  178.22.122.101 185.51.200.1
    echo "✅ ${GREEN} Pro Shecan set as DNS server.${NC} Checking..."
fi

if [ "$var" -eq "3" ]; then
    networksetup -setdnsservers Wi-Fi\  192.168.103.200 192.168.103.201
    echo "✅ ${GREEN} FortiClient set as DNS server.${NC} Checking..."
fi

if [ "$var" -eq "0" ] || [ "$var" -eq "-" ]; then
    echo "✅ ${RED}Removing${NC} these DNS servers:\n${CYAN}$(networksetup -getdnsservers Wi-Fi\ )${NC}"
    sleep 0.5
    networksetup -setdnsservers Wi-Fi\  "empty"
    echo "${RED}[!]${NC} DNS servers are reset to your DHCP."
fi
