#!stateconf yaml . jinja

.ngingx_conf:
  file.managed:
    - name: /etc/nginx/sites-enabled/nginx.conf
    - source: salt://nginx/wordpress_nginx.conf.template

.remove_default_nginx_config:
  file.absent:
    - name: /etc/nginx/sites-enabled/default

.nginx_restart:
  cmd.run:
    - name: sudo service nginx restart    
    - cwd: /home/{{ grains['user'] }}
    - user: {{ grains['user'] }}
