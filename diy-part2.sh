#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.2/g' package/base-files/files/bin/config_generate

# 增加 alist （在 ./scripts/feeds install -a 操作之后更换 golang 版本）
#rm -rf feeds/packages/lang/golang
#svn export https://github.com/sbwml/packages_lang_golang/branches/19.x feeds/packages/lang/golang

# tmp fix-20230819之前编译失败回滚配置
#wget -O ./package/kernel/linux/modules/netsupport.mk https://raw.githubusercontent.com/coolsnowwolf/lede/3ef1f5ade3b8f6527bbc4eb9494138de66e07d13/package/kernel/linux/modules/netsupport.mk

# 2023-08-29 aliyundrive-webdav 编译报错回滚到2.2.1
#curl -o ./feeds/packages/multimedia/aliyundrive-webdav/Makefile https://raw.githubusercontent.com/Jason6111/OpenWrt_Personal/main/other/aliyun/Makefile

# 临时修复acpid,xfsprogs,aliyundrive-webdav,perl-html-parser
#sed -i 's#flto#flto -D_LARGEFILE64_SOURCE#g' feeds/packages/utils/acpid/Makefile
#sed -i 's#SYNC#SYNC -D_LARGEFILE64_SOURCE#g' feeds/packages/utils/xfsprogs/Makefile
#sed -i 's/stripped/release/g' feeds/packages/multimedia/aliyundrive-webdav/Makefile
#cp -f $GITHUB_WORKSPACE/scripts/perlmod.mk feeds/packages/lang/perl/perlmod.mk
sed -i 's/REENTRANT -D_GNU_SOURCE/LARGEFILE64_SOURCE/g' feeds/packages/lang/perl/perlmod.mk

# 解决 luci-app-passwall 1+2 状态页延时检测为 0.00 ms 的问题
#./scripts/feeds install -a
#rm -rf feeds/packages/net/curl
#git clone https://github.com/sbwml/feeds_packages_net_curl feeds/packages/net/curl

# MosDNS
#rm -rf feeds/packages/net/mosdns
#rm -rf feeds/packages/mosdns
#rm -rf feeds/luci/applications/luci-app-mosdns
#git clone https://github.com/sbwml/luci-app-mosdns package/luci-app-mosdns

# 删除重复的插件。
./scripts/feeds clean
./scripts/feeds update -a
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,smartdns}
rm -rf feeds/smpackage/luci-app-adguardhome
rm -rf feeds/smpackage/luci-app-bypass
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
./scripts/feeds install -a
