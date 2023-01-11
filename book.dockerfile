from nginx:alpine
copy book /usr/share/nginx/html
copy default.conf /etc/nginx/conf.d/default.conf
