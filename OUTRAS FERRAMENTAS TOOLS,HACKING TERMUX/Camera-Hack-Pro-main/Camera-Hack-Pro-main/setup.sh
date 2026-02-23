#!/bin/bash

# কালার কোডসমূহ
RED='\033[0;31m'
GREEN='\033[0;32m'
D_BLUE='\033[1;34m' # গাঢ় নীল
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# স্ক্রিন ক্লিয়ার করা
clear


# Reference ডান দিকে কর্নারে
echo -e "${RED}                               Reference: SHAN PONG${NC}"
echo -e "${RED}"
echo "                .----."
echo "               /      \\"
echo "              | ()  () |"
echo "               \  ^^  /"
echo "                ||||||"
echo "               '------'"
echo -e "${NC}"
echo -e "${GREEN}      Ethical Hacking With World${NC}"

# Version 
echo -e "${D_BLUE}                                         Version: v1.0${NC}"
echo -e "${GREEN}------------------------------------------------------------${NC}"

# মেনু
echo -e "${WHITE}1. Camera Hack ( SUBSCRIBR )"
echo -e "2. Exit${NC}"
echo -e "${GREEN}------------------------------------------------------------${NC}"

# ইউজার ইনপুট
read -p "Select an option (1 or 2): " choice

if [ "$choice" == "1" ]; then
    echo -e "${D_BLUE}Opening YouTube... Please Subscribe!${NC}"
    sleep 2
    termux-open-url https://youtube.com/@ethicalhackingwithworld2?si=J7dL-hug3w6ZFg3a
    
    echo -e "${WHITE}\nDid you subscribe? (y/n): ${NC}"
    read sub_choice
    
    if [[ "$sub_choice" == "y" || "$sub_choice" == "Y" ]]; then
        echo -e "${GREEN}Access Granted! Starting Server...${NC}"
        mkdir -p logs
        php -S 127.0.0.1:8080
    else
        echo -e "${RED}Subscription is required!${NC}"
        exit
    fi

elif [ "$choice" == "2" ]; then
    echo -e "${WHITE}Exiting... Goodbye!${NC}"
    exit

else
    echo -e "${RED}Invalid Option! Please run again.${NC}"
fi

