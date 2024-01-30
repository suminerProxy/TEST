#!/bin/bash

# 下载、解压、切换目录
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz \
  && tar -zxf apphub-linux-amd64.tar.gz \
  && rm -f apphub-linux-amd64.tar.gz \
  && cd ./apphub-linux-amd64

# 移除服务、安装服务
sudo ./apphub service remove \
  && sudo ./apphub service install

# 启动服务
sudo ./apphub service start

# 查看状态
./apphub status

# 休眠3秒
sleep 30

# 配置token并重启
sudo ./apps/gaganode/gaganode config set --token=hesbxducrynlhdxifee6336a5e279047 \
  && ./apphub restart
