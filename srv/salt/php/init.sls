update_apt_for_php:
  cmd.run:
    - name: sudo apt -y install software-properties-common; sudo add-apt-repository -y ppa:ondrej/php; sudo apt -y update; sudo apt -y upgrade
    - cwd: /home/{{ grains['user'] }}
    - user: {{ grains['user'] }}

install_php:
  pkg.installed:
    - pkgs:
      - php5.6
      - php5.6-curl
      - php5.6-gd
      - php5.6-fpm
      - php5.6-mysql
      - php5.6-intl
      - php5.6-mcrypt
      - php5.6-pspell
      - php5.6-recode
      - php5.6-snmp
      - php5.6-tidy
      - php5.6-xmlrpc
      - php5.6-xsl

/etc/php/5.6/fpm/php.ini:
  file.managed:
    - source: salt://php/php.ini
    - user: {{ grains['user'] }}
    - group: {{ grains['user'] }}

create_dir_for_phpfpm_sock:
  file.directory:
    - name: /run/php

sudo service php5.6-fpm restart:
  cmd.run
