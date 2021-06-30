#!/bin/bash
cd `dirname $0`
img_node="node:12.6.0-buster-slim"                 # docker image of maven
proj_home=$PWD                              # the project root dir


git pull  

echo "use docker node.js ..."
echo "npm install..."
echo "npm run build..."
docker run --rm \
   -v $proj_home:/usr/src/mynode \
   -w /usr/src/mynode $img_node sh -c 'npm install --registry=https://registry.npm.taobao.org && npm run build '

# && cp -r docs/.vuepress/dist /usr/share/nginx/html 


echo "start build image ..."
docker build -t blog:latest .
echo "remove old container ..."
docker rm -f myblog
echo "run myblog ..."
docker run -d -p 80:80 blog:latest --name myblog






