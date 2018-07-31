@call %~dp0\util\util.cmd

docker build -t %container% . %*
