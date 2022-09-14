#!/usr/bin/env sh
set -e
service php8.0-fpm start
nginx -g 'daemon off;'
