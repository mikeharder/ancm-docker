@if [%1]==[] goto usage

@call %~dp0\util\util.cmd

copy /y %1 %~dp0\share\aspnetcorev2_outofprocess.dll

: Version is "9.9.99999", which should be higher than anything released publicly
docker exec -it %container% cmd /c mkdir "\Program Files\IIS\Asp.Net Core Module\V2\9.9.99999"
docker exec -it %container% cmd /c copy /y \share\aspnetcorev2_outofprocess.dll "\Program Files\IIS\Asp.Net Core Module\V2\9.9.99999"

@call %~dp0\iisreset.cmd

@goto :eof

:usage
@echo Usage: %~nx0 path\to\aspnetcorev2_outofprocess.dll
@exit /b 1
