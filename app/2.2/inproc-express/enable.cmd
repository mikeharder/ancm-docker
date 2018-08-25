docker exec -it %container% reg delete "HKLM\SOFTWARE\Microsoft\IIS Extensions\IIS AspNetCore Module\Parameters" /f /v DisableANCM

@call %~dp0\iisreset.cmd
