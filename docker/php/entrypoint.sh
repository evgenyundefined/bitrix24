#!/bin/sh
set -e

if [ -d /var/www/html ]; then
  echo "Permissions for /var/www/html"
  chown -R www-data:www-data /var/www/html || true
fi

exec "$@"
