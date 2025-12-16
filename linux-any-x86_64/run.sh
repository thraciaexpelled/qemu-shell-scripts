#!/usr/bin/env bash

set -e

ISO=$1
DISK=""

[[ -z "$ISO" ]] && echo "ISO not set" >&2 && exit 1	
[[ -f "disk.qcow2" ]] || qemu-img create disk.qcow2 20G -f qcow2 && DISK="disk.qcow2"

echo "	Using ISO: 	'$ISO'"
echo "	Using DISK:	'$DISK'" 	 
echo

qemu-system-x86_64 -drive file="$DISK",media=disk,format=qcow2 \
	-drive file="$ISO",media=cdrom \
	-m 2048 \
	-netdev user,id=vmnic \
	-device virtio-net-pci,netdev=vmnic \
	-accel tcg \
	-boot d 

