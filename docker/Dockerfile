FROM ubuntu:20.04

# Tools
RUN apt update
RUN apt install -y software-properties-common 
RUN apt install -y git curl mysql-client

# PHP
RUN add-apt-repository ppa:ondrej/php
RUN apt update && apt install -y php8.2

# PHP Extensions
RUN apt install -y php8.2-curl php8.2-dom php8.2-mysql php8.2-zip php8.2-gd 
RUN apt install -y php8.2-mbstring php8.2-xml php8.2-bcmath php8.2-intl php8.2-fpm php8.2-tokenizer

# Composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN composer self-update

# Node
RUN apt install -y nodejs npm

# Workspace
RUN git clone https://github.com/laravelio/laravel.io.git /home/Sites/laravel.io
WORKDIR /home/Sites/laravel.io

RUN composer install

# Setup
RUN cp .env.example .env
RUN php artisan key:generate
RUN npm install -g n && n latest
RUN npm install && npm run build

# Laravelio Start Script
ENV MIGRATE_DATABASE=true
ENV SEED_DATABASE=true

RUN echo -e '#!/bin/sh\n\
if [ "$MIGRATE_DATABASE" = "true" ]; then\n\
    php artisan migrate\n\
fi\n\
if [ "$SEED_DATABASE" = "true" ]; then\n\
    php artisan db:seed\n\
fi\n\
php artisan serve --host=0.0.0.0 --port=8000' > start.sh

EXPOSE 8000

CMD ["sh", "start.sh"]
