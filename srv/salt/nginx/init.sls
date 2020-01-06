#!stateconf yaml . jinja

.nginx_install:
  pkg.installed:
    - name: nginx-full

.nginx_start:
  cmd.run:
    - name: sudo service nginx start    
    - cwd: /home/{{ grains['user'] }}
    - user: {{ grains['user'] }}
