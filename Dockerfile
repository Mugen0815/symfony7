ARG SYMFONY_PARAMS="--version=7.0.* --webapp"

FROM php:8.2-apache
#RUN apt update && apt install -y zip git curl && git config --global user.email "you@example.com" && git config --global user.name "Your Name"
RUN apt update && apt install -y \
    libicu-dev \
    libonig-dev \
    libzip-dev \
    zip \
    unzip \
    curl \
    git \
    && git config --global user.email "you@example.com" && git config --global user.name "Your Name" \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install zip
RUN docker-php-ext-enable intl mbstring zip

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV SYMFONY_PARAMS_STD="--version=7.0.* --webapp"

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash && apt install -y symfony-cli

COPY apache-default.conf /etc/apache2/sites-available/000-default.conf
WORKDIR /usr/src
VOLUME /usr/src

COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
