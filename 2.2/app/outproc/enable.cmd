docker exec -it ancm-app-2.2-outproc cmd /c reg delete "HKLM\SOFTWARE\Microsoft\IIS Extensions\IIS AspNetCore Module\Parameters" /f /v DisableANCM ^& iisreset
