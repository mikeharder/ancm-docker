for /f %%i in ('docker inspect --format "{{ .NetworkSettings.Networks.nat.IPAddress }}" ancm-app-2.1-outproc') do curl -v http://%%i:80
