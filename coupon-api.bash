#!/usr/bin/env bash
git pull
docker run -v ~/.m2:/root/.m2 -v "$PWD":/tmp/build --rm -w /tmp/build maven:3.3.3-jdk-7 mvn package -Pprod -Dmaven.test.skip=true
docker build --build-arg APP_MODULE="coupon-api" -t xiaohuodui/coupon-api .
#查询 dmn-api 这个容器, 并停止 移除它
CID=$(docker ps -a | grep 'coupon-api' | awk '{print $1}');
docker stop $CID
docker rm $CID
#执行新起一个容器
docker run -d -p 192.168.0.1:8090:8080 -v ~/logs:/usr/local/tomcat/logs  --name coupon-api -e TZ=Asia/Shanghai xiaohuodui/coupon-api