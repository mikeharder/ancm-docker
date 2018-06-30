docker build -t ancm-app:2.2-inproc-express --build-arg hosting_model=inprocess %~dp0/.. -f %~dp0/../express/Dockerfile
