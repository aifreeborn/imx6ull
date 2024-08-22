#!/bin/bash

if [ $# -ne 1 -a $# -ne 2 ];then
    echo "Usage: $0 [uboot | flash /dev/sdb]"
    exit
fi

if [[ "$1" == "uboot" ]];then
    make distclean
    make mx6ull_100ask_emmc_defconfig
    make
elif [[ "$1" == "flash" ]] && [[ -n $2 ]];then
    sudo dd if=u-boot-dtb.imx of=$2 bs=1k seek=1 conv=fsync
else
    echo do nothing......
fi
