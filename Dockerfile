FROM ubuntu
RUN apt-get update
RUN apt-get install nginx -y

RUN apt-get install lsb-release ca-certificates apt-transport-https software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN apt-get install tzdata -y
RUN apt-get install php8.0 -y
RUN apt-get install php8.0-fpm -y
RUN apt-get install php8.0-cli php8.0-common php8.0-imap php8.0-redis php8.0-xml php8.0-zip php8.0-mbstring -y
copy default /etc/nginx/sites-available/
copy info.php /var/www/html/
copy entrypoint_start.sh /opt/
RUN rm -rf /var/www/html/index.html
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
ENTRYPOINT ["sh","/opt/entrypoint_start.sh"]
