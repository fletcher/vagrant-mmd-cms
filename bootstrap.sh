#!/usr/bin/env bash

apt-get update


# Install Apache and required Perl Modules for MMD-CMS
apt-get install -y apache2 xsltproc libcgi-session-perl libio-string-perl

# Additional modules to enable OpenID for comments, but it's not clear 
# that this sytem really works any more
# apt-get install -y libwww-perl libdigest-sha-perl libxml-simple-perl

# Enable Apache modules
a2enmod include rewrite cgi headers

# Use /vagrant/www as the source directory for Apache
if ! [ -L /var/www/html ]; then
	rm -rf /var/www/html
	mkdir -p /vagrant/www
	ln -fs /vagrant/www /var/www/html
fi

# Enable AllowOverride for .htaccess files in /var/www/html
cp /vagrant/000-default.conf /etc/apache2/sites-available/000-default.conf

# Restart Apache 
service apache2 restart
