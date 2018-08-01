@call %~dp0\util\util.cmd

docker exec -it %container% powershell "clear-eventlog -logname application"
