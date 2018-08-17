@call %~dp0\util\util.cmd

docker exec -it %container% cmd /c taskkill /f /im dotnet.exe
