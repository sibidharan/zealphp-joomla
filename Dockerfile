# Self-contained — builds ZealPHP + this app from source.
FROM php:8.4-cli-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git wget unzip libssl-dev libcurl4-openssl-dev libxml2-dev \
    libpq-dev libsqlite3-dev libssh2-1-dev autoconf gcc make \
    && rm -rf /var/lib/apt/lists/*
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN git clone --depth 1 --branch v0.3.7 https://github.com/sibidharan/zealphp.git /app \
    && cd /app && bash setup.sh --docker \
    && composer install --no-dev --prefer-dist --no-interaction --no-progress --optimize-autoloader

# Clone + place the app
RUN git clone --depth 1 https://github.com/joomla/joomla-cms.git /apps/joomla

COPY app.php /app/app.php
EXPOSE 8080
CMD ["php", "/app/app.php"]
