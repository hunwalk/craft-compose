FROM php:8.1-fpm-alpine

# MozJPEG
ENV MOZJPEG_VERSION="3.3.1"
ENV MOZJPEG_BUILD_DEPS \
    autoconf \
    automake \
    build-base \
    libtool \
    nasm \
    pkgconf \
    tar

RUN apk upgrade --no-cache \
    && apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    $MOZJPEG_BUILD_DEPS \
    freetype-dev \
    icu-dev \
    icu-data-full \
    libwebp-dev \
    imagemagick-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libzip-dev \
    postgresql-dev

RUN apk add --no-cache \
    gifsicle \
    imagemagick \
    jpegoptim \
    libjpeg-turbo-utils \
    libwebp-tools \
    optipng \
    pngquant

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    gd \
    intl \
    opcache \
    pdo \
    pdo_mysql \
    soap \
    zip

RUN pecl install imagick

# install mysql

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apk add --no-cache mysql-client

RUN docker-php-ext-enable imagick

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html