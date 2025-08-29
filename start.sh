#!/bin/bash
set -e

# Start PHP-FPM in background
php-fpm &

# Start Nginx in foreground (PID 1)
nginx -g 'daemon off;'
