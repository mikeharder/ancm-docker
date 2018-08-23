@if [%2]==[] goto usage

copy /y %2 %1\share\aspnetcore.dll

docker exec -it %container% cmd /c copy /y \share\aspnetcore.dll %modulepath%

@call %~dp0\iisreset.cmd

@goto :eof

:usage
@echo Usage: %~nx0 path\to\aspnetcore.dll
@exit /b 1
