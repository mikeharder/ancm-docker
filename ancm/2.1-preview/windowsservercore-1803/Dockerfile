FROM microsoft/iis-dotnet:2.1.2-windowsservercore-1803

COPY aspnetcoremodule_x64_en.msi aspnetcoremodule_x86_en.msi ./

RUN powershell -Command Start-Process .\aspnetcoremodule_x64_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\aspnetcoremodule_x86_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm aspnetcoremodule_x64_en.msi, aspnetcoremodule_x86_en.msi

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.  
ENTRYPOINT [ "timeout", "-1" ]
