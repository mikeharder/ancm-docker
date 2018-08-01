@if [%1]==[] goto usage

@call %~dp0\util\util.cmd

copy /y %1 share\aspnetcorev2.dll

docker exec -it %container% cmd /c copy /y \share\aspnetcorev2.dll "\Program Files\IIS\Asp.Net Core Module\V2"

@call %~dp0\iisreset.cmd

@goto :eof

:usage
@echo Usage: %~nx0 path\to\aspnetcorev2.dll
@exit /b 1
