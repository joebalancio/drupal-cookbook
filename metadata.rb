maintainer       "Joe Balancio"
maintainer_email "jlbalancio@gmail.com"
license          "All rights reserved"
description      "Installs/Configures drupal"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe           "drupal", "Installs/Configures drupal"

depends "php"
depends "apache2"
depends "mysql"
depends "openssl"
