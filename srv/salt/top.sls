base:
  'roles:devbox':
    - match: grain
    - devbox
    - nginx
    - nginx.wordpress_config
    - mysql
    - php
    - wordpress
