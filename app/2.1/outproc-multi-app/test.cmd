@echo off

for /f "usebackq tokens=*" %%a in (`docker inspect --format "{{ .NetworkSettings.Networks.nat.IPAddress }}" ancm-app-2.1-outproc-multi-app`) do set ip=%%a

@echo on

curl -v http://%ip%:80/app1
