docker build -t ancm-app:2.2-inproc --build-arg hosting_model=inprocess %~dp0/.. -f %~dp0/../iis/Dockerfile
