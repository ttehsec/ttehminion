#!/bin/bash
#Thanks you for using Touches Helper. This is an open-source project for Ethical Hacker looking to automate some of the most known tool. Feel free to edit this project as you see fit.

#Adding to the main menu: see examples below. First without text color, second with text color.
	#printf "3. SMB\n" 
	#printf "4. ${LIGHTRED}Exit\n${SET}"



#colors

DARKGRAY='\033[1;30m'
RED='\033[0;31m'    
LIGHTRED='\033[1;31m'
GREEN='\033[0;32m'    
YELLOW='\033[1;33m'
BLUE='\033[0;34m'    
PURPLE='\033[0;35m'    
LIGHTPURPLE='\033[1;35m'
CYAN='\033[0;36m'    
WHITE='\033[1;37m'
SET='\033[0m'



main_menu ()  { while true; do   
printf "\n${BLUE}Touches Minion...${GREEN}\n\nMain Menu........\n\n${SET}"

printf "1. Nmap\n"
printf "2. Gobuster\n"
printf "3. SMB\n"
printf "4. ${LIGHTRED}Exit\n${SET}"
printf "*****************\n"
read -p "Select your scan:  " choice

case $choice in
    1) Nmap;;
    2) Gobuster;;
    3) SMB;;
    4) exit;;
    *) printf "${LIGHTRED}\n\nInvalid selection${SET} : Returning to main menu....... \n\n"
esac
done
}

Nmap() { while true; do
    printf "${GREEN}\n\nNmap menu........\n\n${SET}"
    read -p "Enter IP Address: " IP
    printf "\n1.${YELLOW} Slow\n${SET}"
    printf "2.${GREEN} Normal\n${SET}"
    printf "3.${RED} Fast\n${SET}"
    printf "4. ${CYAN}Back\n${SET}"
    printf "5. ${LIGHTRED}Exit\n${SET}"
    printf "\n"
    read -p "Select scan speed: " Speed
    
    case $Speed in
        1) printf "\n\nSlow selected"
           printf "${GREEN}\nRunning 'slow' Nmap scan.....\n${SET}"
           nmap -A -p- -T4 $IP
        
           ;;
        2) printf "\n\nNormal selected"
           printf "${GREEN}\nRunning 'normal' Nmap scan.....\n${SET}"
           nmap -sV -sC -p- -T4 $IP
           ;;
        3) printf "\n\nFast selected"
           printf "${GREEN}\nRunning 'fast' Nmap scan.....\n${SET}"
           nmap -sV -sC -p- --min-rate 5000 $IP
           ;;
        4) main_menu;;
        
        5) exit;;
        *) printf "${LIGHTRED}\ninvaild selection${SET}: Returing to Nmap Menu.....  \n\n"
    
    
    esac
    done
}

Gobuster()  { while true; do
    printf "${GREEN}\n\nGobuster menu....\n\n${SET}"
    read -p "Enter IP Address: " IP
    printf "\n1. Sm"
    printf "\n2. Med"
    printf "\n1. LG"
    printf "\n4. ${CYAN}Back${SET}"
    printf "\n5. ${LIGHTRED}Exit${SET}\n"
    printf "\n"
    read -p "Select wordlist size : " Size
    
    
    case $Size in
        1) printf "\nSm selected"
           printf "${GREEN}\nUsing'Sm' wordlist .....\n${SET}"
           gobuster dir --url http://$IP/ --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-small.txt -x php 
        
           ;;
        2) printf "\n\nMed selected"
           printf "${GREEN}\nRUsing'Med' wordlist ....\n${SET}"
           gobuster dir --url http://$IP/ --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
           ;;
        3) printf "\n\nFast selected"
           printf "${GREEN}\nUsing'Lg' wordlist .....\n${SET}"
           gobuster dir --url http://$IP/ --wordlist /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-20000.txt
           ;;
        4) main_menu;;
        
        5) exit;;
        *) printf "${LIGHTRED}\nInvaild selection${SET}: Returning to Gobuster menu..... \n\n"
    
    
    esac
done
}

SMB()  { while true; do
    printf "${GREEN}\n\nSMB menu.........\n\n${SET}"
    read -p "Enter IP Address: " IP
    printf "\n\n1.${YELLOW} List Shares${SET}"
    printf "\n2.${LIGHTRED} Test for Uncredentialed Access${SET}"
    printf "\n3.${GREEN} Access with Credentials ${SET}"
    printf "\n4. ${CYAN}Back${SET}"
    printf "\n5. ${LIGHTRED}Exit${SET}"
    printf "\n\n"
    read -p "What would you like to do: " access
    
    
    case $access in
        1) printf "${CYAN}}\n\nList Shares selected${SET}"
           printf "${GREEN}\n\nAttempting to List Shares now.....\n${SET}"
           smbclient -N -L \\\\$IP\\
        
           ;;
        2) printf "${CYAN}\nTest for Uncredentialed Access selected\n${SET}"
           read -p "Share Name : " share
           printf "${GREEN}\nAttempting to gain access now..........\n${SET}"
           printf "${CYAN}Hit 'enter' or input a password when prompted\n"${SET}
           smbclient \\\\$IP\\$share
           ;;
        3) printf "${CYAN}\nAccess with Credentials selected\n${SET}"
           read -p "Share Name : " share
           read -p "Username : " uname
           printf "${GREEN}\nAttempting to gain access now......\n${SET}"
           smbclient \\\\$IP\\$share -U $uname
           ;;
        4) main_menu;;
        
        5) exit;;
        
        *) printf "${LIGHTRED}\nInvaild selection${SET}: Returning to SMB menu.... \n\n"


    esac
done
}

main_menu
