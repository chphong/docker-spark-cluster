#!/bin/bash
IMAGE_VERSION="v1.0"

set -e

docker build -t spark-base:latest ./docker/base
docker build -t spark-master:latest ./docker/spark-master
docker build -t spark-worker:latest ./docker/spark-worker
docker build -t spark-submit:latest ./docker/spark-submit

docker login --username=876684433@qq.com --password=oabro-backend registry.cn-hangzhou.aliyuncs.com

docker tag spark-base:latest  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-base:$IMAGE_VERSION
docker push  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-base:$IMAGE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-base:$IMAGE_VERSION

docker tag spark-submit:latest  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-submit:$IMAGE_VERSION
docker push  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-submit:$IMAGE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-submit:$IMAGE_VERSION

docker tag spark-master:latest  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-master:$IMAGE_VERSION
docker push registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-master:$IMAGE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-master:$IMAGE_VERSION

docker tag spark-worker:latest  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-worker:$IMAGE_VERSION
docker push  registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-worker:$IMAGE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/chenpeihong/spark-worker:$IMAGE_VERSION

docker logout