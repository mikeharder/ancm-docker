@docker exec -it %container% reg add "HKLM\SOFTWARE\Microsoft\IIS Extensions\IIS AspNetCore Module\Parameters" /f /v DisableANCM /t REG_DWORD /d 1

@call %~dp0\iisreset.cmd
