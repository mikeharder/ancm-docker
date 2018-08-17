@if [%1]==[] goto usage

@call %~dp0\util\util.cmd

copy /y %1 %~dp0\share\aspnetcore.dll

docker exec -it %container% cmd /c copy /y \share\aspnetcore.dll \windows\system32\inetsrv\aspnetcore.dll

@call %~dp0\iisreset.cmd

@goto :eof

:usage
@echo Usage: %~nx0 path\to\aspnetcore.dll
@exit /b 1
