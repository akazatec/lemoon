#!/bin/bash

clear

echo -e "\e[1;33m"
echo "  ╔══════════════════════════════════════╗"
echo "  ║           Lemoon Setup               ║"
echo "  ║        Author: AKAZA SENZO           ║"
echo "  ╚══════════════════════════════════════╝"
echo -e "\e[0m"

echo -e "\e[1;33m[*] Checking system...\e[0m"
if command -v pkg &> /dev/null; then
    pkg update -y && pkg upgrade -y
elif command -v apt &> /dev/null; then
    sudo apt update -y && sudo apt upgrade -y
fi

echo -e "\e[1;33m[*] Verifying Python...\e[0m"
if ! command -v python3 &> /dev/null; then
    if command -v pkg &> /dev/null; then
        pkg install python -y
    elif command -v apt &> /dev/null; then
        sudo apt install python3 python3-pip -y
    fi
fi

echo -e "\e[1;33m[*] Installing packages...\e[0m"
pip3 install -r requirements.txt

echo -e "\e[1;32m"
echo "  [✓] Setup Done! Start: python3 lemoon.py"
echo -e "\e[0m"
