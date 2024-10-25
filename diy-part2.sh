#!/bin/bash
#
#
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

cp -f diy/common/zzz-default-settings package/lean/default-settings/files/zzz-default-settings
# banner
cp -f diy/banner package/base-files/files/etc/banner
sed -i "s/%D %V, %C/openwrt $(date +'%m.%d') by ${AUTHORED_BY}/g" package/base-files/files/etc/banner

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# Modify default theme
# sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
sed -i 's/OpenWrt/N4505/g' package/base-files/files/bin/config_generate

# 编译内核版本
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=6.6/g' ./target/linux/x86/Makefile
