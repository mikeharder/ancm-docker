docker exec -it ancm-app-2.2-inproc cmd /c reg add "HKLM\SOFTWARE\Microsoft\IIS Extensions\IIS AspNetCore Module\Parameters" /f /v DisableANCM /t REG_DWORD /d 1 ^& iisreset
