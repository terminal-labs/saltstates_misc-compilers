install_mysql:
  pkg.installed:
    - pkgs:
      - mysql-server
      - mysql-client

mysql_stop:
  cmd.run:
    - name: sudo service mysql stop
    - cwd: /home/{{ grains['user'] }}
    - user: {{ grains['user'] }}
   
mysql_start:
  cmd.run:
    - name: sudo service mysql start
    - cwd: /home/{{ grains['user'] }}
    - user: {{ grains['user'] }}
