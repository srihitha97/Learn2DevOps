FROM nginx:alpine
MAINTAINER Srihitha Yadlapalli <saisrihithay@gmail.com>

COPY website /website
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
