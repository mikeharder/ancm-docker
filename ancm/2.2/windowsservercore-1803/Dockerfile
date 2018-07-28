FROM microsoft/iis:windowsservercore-1803

COPY dotnet-hosting-*-win.exe dotnet-hosting-2.2-win.exe

RUN powershell -Command Start-Process .\dotnet-hosting-2.2-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.2-win.exe

# Remove existing content from C:\inetpub\wwwroot
RUN powershell -Command Remove-Item -Recurse C:\inetpub\wwwroot\*

# Create logs dir and give IIS full access
RUN mkdir C:\Logs & icacls C:\Logs /grant "IIS APPPOOL\DefaultAppPool":F

WORKDIR /inetpub/wwwroot

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.  
ENTRYPOINT [ "timeout", "-1" ]
