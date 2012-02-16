#!/bin/bash
echo "Hello"
#$1 -- path of flash drive
#$2 -- path of operating system

umount $1

echo "------------Formatting your flash drive------------------"
mkfs.vfat $1

mount $1 /media
dd if=$2 of=$1

