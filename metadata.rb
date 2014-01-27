maintainer       "David King, xforty technologies"
maintainer_email "dking@xforty.com"
license          "Apache 2.0"
description      "Installs/Configures xdebug"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

depends          "php"
suggests         "apache2"
suggests         "nginx"

recipe "xdebug", "Installs/configures xdebug."
recipe "xdebug::fpm", "Runs xdebug recipe then restarts PHP5-FPM."
recipe "xdebug::apache2", "Runs xdebug recipe then restarts Apache2."
