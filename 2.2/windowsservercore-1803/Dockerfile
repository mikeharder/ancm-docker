FROM microsoft/iis:windowsservercore-1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY dotnet-hosting-*-win.exe dotnet-hosting-2.2-win.exe

RUN Start-Process .\dotnet-hosting-2.2-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.2-win.exe
