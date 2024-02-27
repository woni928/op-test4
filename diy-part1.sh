#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# 替换内核
#sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.4/g' ./target/linux/x86/Makefile

#!/bin/bash

#mkdir -p files/etc/openclash/core

#CLASH_DEV_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/dev/clash-linux-${1}.tar.gz"
#CLASH_TUN_URL=$(curl -fsSL https://api.github.com/repos/vernesong/OpenClash/contents/master/premium\?ref\=core | grep download_url | grep $1 | awk -F '"' '{print $4}' | grep -v 'v3')
#CLASH_META_URL="https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-${1}.tar.gz"
#GEOIP_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat"
#GEOSITE_URL="https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat"

#wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
#wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
#wget -qO- $CLASH_META_URL | tar xOvz > files/etc/openclash/core/clash_meta
#wget -qO- $GEOIP_URL > files/etc/openclash/GeoIP.dat
#wget -qO- $GEOSITE_URL > files/etc/openclash/GeoSite.dat

#chmod +x files/etc/openclash/core/clash*
