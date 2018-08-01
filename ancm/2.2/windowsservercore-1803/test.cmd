@call %~dp0\util\util.cmd
docker exec -it %container% cmd /c curl -v http://localhost:80
