#!/bin/bash
cd `dirname $0`
img_node="node:12.6.0-buster-slim"                 # docker image of maven
proj_home=$PWD                              # the project root dir


git pull  

echo "use docker node"
docker run --rm \
   -v $proj_home:/usr/src/mynode \
   -w /usr/src/mynode $img_node sh -c 'npm install --registry=https://registry.npm.taobao.org && npm run build '

# && cp -r docs/.vuepress/dist /usr/share/nginx/html 


echo "mv dist start"
docker build -t blog:latest .

docker run -d -p 80:80 blog:latest






