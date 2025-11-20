FROM php:8.1-fpm-alpine

RUN apk add --no-cache \
    bash \
    curl \
    git \
    icu-dev \
    libxml2-dev \
    oniguruma-dev \
    libzip-dev \
    freetype-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    linux-headers \
    $PHPIZE_DEPS

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j"$(nproc)" \
    gd \
    intl \
    pdo_mysql \
    mysqli \
    opcache \
    zip \
    bcmath \
    soap \
    mbstring

RUN pecl install redis xdebug \
 && docker-php-ext-enable redis xdebug

WORKDIR /var/www/html

COPY docker/php/php.ini /usr/local/etc/php/conf.d/zz-bitrix.ini

COPY docker/php/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

CMD ["php-fpm"]
