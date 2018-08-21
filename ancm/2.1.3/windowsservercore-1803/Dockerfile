FROM microsoft/iis:windowsservercore-1803

RUN powershell -Command (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/6/E/B/6EBD972D-2E2F-41EB-9668-F73F5FDDC09C/dotnet-hosting-2.1.3-win.exe', 'dotnet-hosting-2.1.3-win.exe') ; \
    Start-Process .\dotnet-hosting-2.1.3-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.1.3-win.exe

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.  
ENTRYPOINT [ "timeout", "-1" ]
