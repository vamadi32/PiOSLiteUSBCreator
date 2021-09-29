#!/bin/zsh

#This script will try to create a bootable piUSB

dirLoc=$(dirname $0)
imageLoc=$dirLoc/2021-05-07-raspios-buster-armhf-lite.img
#fileName=$(basename $imageLoc)

if [[ -f $imageLoc ]]; then
    read  "ans?image exist run now?: "
    if [[ $ans =~ ^[Yy]$ ]]; then
        diskutil list 
        read  "num?what disk number does the external usb have?: " 
        read  "verify?Are you sure you want to continue?: "
        if [[ $verify =~ ^[Yy]$ ]]; then
            echo "unmounting disk"
           diskutil unmount /dev/disk$num
           err=$?
           if [[ $err -ne 0 ]]; then
               echo "failed to unmount. Trying second option..."
               diskutil unmountDisk /dev/disk$num
           fi
            sudo dd bs=1m if=$imageLoc of=/dev/rdisk$num
            diskutil unmountDisk /dev/disk$num 
            exit 0
        else
            echo "You are obviously undecided"
            exit 0
        fi
    elif [[ $ans =~ ^[Nn]$ ]]; then
        echo "User chose no"
        exit 0
    else
        echo "wrong choice. Please enter y or n"
        exit 1
    fi
else
    exit 1 
fi
