#!/bin/sh

# Change ownership of the /var/www/html directory to the www-data user
# chown -R www-data:www-data /var/www/html

chmod -R 777 /var/www/html/storage
chmod -R 777 /var/www/html/config
chmod -R 777 /var/www/html/web/cpresources
chmod -R 777 /var/www/html/vendor

composer install


# Start the PHP-FPM process
php-fpm
