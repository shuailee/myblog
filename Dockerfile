FROM nginx:latest

# RUN rm /etc/nginx/conf.d/default.conf

# ADD nginx.conf /etc/nginx/nginx.conf

COPY dist/  /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
