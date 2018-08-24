FROM microsoft/iis:windowsservercore-1803

COPY dotnet-hosting-2.2*-win.exe dotnet-hosting-2.2-win.exe

RUN powershell -Command Start-Process .\dotnet-hosting-2.2-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.2-win.exe

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.  
ENTRYPOINT [ "timeout", "-1" ]
