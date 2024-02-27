# Use a specific version of Alpine as the base image
ARG ALPINE_VERSION=3.19.0
FROM alpine:${ALPINE_VERSION}

# Metadata as labels
LABEL Maintainer="Nick Maietta <me@nickmaietta.com>"
LABEL Description="Lightweight container with Nginx & PHP 8.3 based on Alpine Linux."

# Set environment variables
ENV NODE_ENV production

# Set working directory
WORKDIR /var/www/html

# Install necessary packages and remove default server definition
RUN apk add --no-cache \
  curl \
  imagemagick \
  libwebp-tools \
  nginx \
  php-sqlite3 \
  php83 \
  php83-ctype \
  php83-curl \
  php83-dom \
  php83-fpm \
  php83-gd \
  php83-iconv \
  php83-intl \
  php83-json \
  php83-mbstring \
  php83-openssl \
  php83-pdo \
  php83-pdo_mysql \
  php83-pdo_sqlite \
  php83-session \
  php83-simplexml \
  php83-xml \
  php83-xmlreader \
  supervisor \
  && rm -rf /etc/nginx/conf.d/default.conf \
  && rm -rf /var/cache/apk/*

# Symlink php8 to php for convenience
RUN ln -s /usr/bin/php83 /usr/bin/php

# Copy nginx configuration files
COPY webserver/nginx.conf /etc/nginx/nginx.conf
COPY webserver/conf.d /etc/nginx/conf.d/

# Copy PHP-FPM configuration files
COPY webserver/fpm-pool.conf /etc/php83/php-fpm.d/www.conf
COPY webserver/php.ini /etc/php83/conf.d/custom.ini

# Copy supervisord configuration file
COPY webserver/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Ensure necessary files/folders are accessible when running under the nobody user
RUN chown -R nobody.nobody /var/www/html /run /var/lib/nginx /var/log/nginx

# Add application files
COPY --chown=nobody public_html/ /var/www/html/

# Switch to use a non-root user
USER nobody

# Expose the port nginx is reachable on
EXPOSE 80

# Configure a healthcheck to validate that everything is up & running
HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1:80/fpm-ping

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
