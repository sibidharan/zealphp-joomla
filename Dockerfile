FROM zealphp/zealphp:0.3.x

RUN apt-get update && apt-get install -y --no-install-recommends git \
    && git clone --depth 1 https://github.com/joomla/joomla-cms.git /apps/joomla \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY app.php /app/app.php
EXPOSE 8080
CMD ["php", "/app/app.php"]
