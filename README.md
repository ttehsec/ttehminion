# MINION
Minion is a menu-based bash script designed to help offensive security professionals save time on active and passive reconnaissance. Simply choose a task, enter an IP address, select a task objective, and your minion will do the rest. 

Tools used in Minion:
* Nmap
* Gobuster
* SMBClient
* SQLMap
* Searchsploit

## Installation
1. Copy the raw code
2. Create a .sh file
3. Paste and save raw code
4. chomd +x file
5. ./minion 

or 

1. git clone https://github.com/ttehsec/ttehminion.git
2. cd ttehminion
3. chmod +x ./minion
4. ./minion

## Usage 
1. ./minion - this will launch minion

https://github.com/ttehsec/ttehminion/assets/113875290/f5906c07-1890-4ce6-985f-89c0369c26b7



## Nmap Reports
1. Nmap output files are named "IP address.speed selections".

## Dependencies
1. SQLmap - sudo apt install sqlmap
2. SMBClient - sudo apt -y install smbclient
3. Gobuster - sudo apt install gobuster

## Note
1. After each task, Minion will default back task menu and it will ask you to enter a IP address. Pressing enter will allow you to bypass the task menu, select another task, or exit.
