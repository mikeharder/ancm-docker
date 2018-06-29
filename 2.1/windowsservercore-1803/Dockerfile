FROM microsoft/iis:windowsservercore-1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/9/3/E/93ED35C8-57B9-4D50-AE32-0330111B38E8/dotnet-hosting-2.1.1-win.exe', 'dotnet-hosting-2.1.1-win.exe') ; \
    Start-Process .\dotnet-hosting-2.1.1-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.1.1-win.exe

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.  
ENTRYPOINT [ "timeout", "-1" ]
