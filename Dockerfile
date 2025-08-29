# 1️⃣ Base image with PHP-FPM
FROM php:8.2-fpm

# 2️⃣ Install system packages + PHP extensions
RUN apt-get update && apt-get install -y \
    nginx \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libwebp-dev \
    libxpm-dev \
    libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-configure intl \
    && docker-php-ext-install gd pdo pdo_mysql intl \
    && rm -rf /var/lib/apt/lists/*

# 3️⃣ Set working directory
WORKDIR /var/www/html

# 4️⃣ Copy application files
COPY . /var/www/html

# 5️⃣ Copy Nginx config
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

# 6️⃣ Permissions for the web user
RUN chown -R www-data:www-data /var/www/html

# 7️⃣ Expose HTTP port
EXPOSE 80

# 8️⃣ Startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# 9️⃣ Run both services (Nginx in foreground)
CMD ["/start.sh"]
