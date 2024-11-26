#!/bin/bash

cd vhdiso

option='-d -R -U -max-iso9660-filenames -D'

size=$(stat -c '%s' ./boot/etfsboot.com)
if [[ "$size" -eq "4096" ]]; then
    loadsize="8"
else
    loadsize="4"
fi

ln ../efi/microsoft/boot/bcd boot/bcd

mkisofs $option -no-emul-boot -boot-load-size $loadsize -b boot/etfsboot.com  -eltorito-alt-boot -no-emul-boot -e  efi.img  -o ../ventoy_vhdboot.img ./ 

ls
