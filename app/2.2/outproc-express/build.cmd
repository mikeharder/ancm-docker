docker build -t ancm-app:2.2-outproc-express --build-arg hosting_model=outofprocess %~dp0/.. -f %~dp0/../express/Dockerfile
