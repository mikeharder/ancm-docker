FROM microsoft/iis:windowsservercore-1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/9/1/7/917308D9-6C92-4DA5-B4B1-B4A19451E2D2/dotnet-hosting-2.1.0-win.exe', 'dotnet-hosting-2.1.0-win.exe') ; \
    Start-Process .\dotnet-hosting-2.1.0-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.1.0-win.exe
