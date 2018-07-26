for /f %%i in ('docker inspect --format "{{ .NetworkSettings.Networks.nat.IPAddress }}" ancm-app-2.2-outproc') do curl -v http://%%i:80
