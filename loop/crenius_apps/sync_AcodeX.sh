#!/bin/bash

# Define folder paths

echo ""
echo "stat of device editor :: "
echo "=========================="
stat /storage/emulated/0/AcodeX_Manager | grep Mod
echo ""
echo "stat of termux editor :: "
echo "======================"
stat ~/AcodeX_Manager | grep Mod
echo ""
echo ""



echo "> chioce ::"
echo "-----------"
echo "1.device to termux"
echo "2.termux to device"
echo ""
echo "your choice : " && read choice
# Check if folders exist


# Determine the newer folder and sync using rsync
if [ $choice -eq  1 ]; then
    rm -r ~/AcodeX_Manager
    cp -r /storage/emulated/0/AcodeX_Manager ~
    echo "Sync successful: The Folder in device -> The Folder in termux"
elif [ $choice -eq  2 ]; then
    rm -r /storage/emulated/0/AcodeX_Manager
    cp -r  ~/AcodeX_Manager /storage/emulated/0/AcodeX_Manager
    echo "Sync successful: The Folder in termux -> The Folder in device"
else
    echo "ERRORE"
fi
