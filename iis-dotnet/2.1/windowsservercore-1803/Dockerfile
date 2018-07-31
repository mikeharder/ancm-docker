FROM microsoft/iis:windowsservercore-1803

RUN powershell -Command \
    (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/f/7/1f7755c5-934d-4638-b89f-1f4ffa5afe89/dotnet-runtime-2.1.2-win-x64.exe', 'dotnet-runtime-2.1-win-x64.exe') ; \
    Start-Process .\dotnet-runtime-2.1-win-x64.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-runtime-2.1-win-x64.exe ; \
    (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/1/f/7/1f7755c5-934d-4638-b89f-1f4ffa5afe89/aspnetcore-runtime-2.1.2-win-x64.exe', 'aspnetcore-runtime-2.1-win-x64.exe') ; \
    Start-Process .\aspnetcore-runtime-2.1-win-x64.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm aspnetcore-runtime-2.1-win-x64.exe

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.
ENTRYPOINT [ "timeout", "-1" ]
