# PiOSLiteUSBCreator

This script prepares pi OS Lite installer on a usb  

**Pre-requisites**

1. This script
2. A Raspberry Pi installer from  https://www.raspberrypi.org/software/operating-systems/ for the following:


* Raspberry Pi OS Lite


**Running the script**

Place the "2021-05-07-raspios-buster-armhf-lite.img" image in the same directory 
as the `piUSbcreator.sh`, connect a microSD card and then run `piUSbcreator.sh` 


What the script does:

1. Prompts for the disk identifier Number eg /dev/diskN where N is the number

2. Uses the `dd` command  to flash the microSD , copy the image files and set up the microSD  to be bootable.



**NOTE**: 

Please make sure you check that the disk identifier number is correct to avoid unknowing WIPING out your partition

