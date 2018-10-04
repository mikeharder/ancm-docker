FROM microsoft/iis:windowsservercore-1803

# Install Failed Request Tracing Module (aka FREB or Failed Request Event Buffering)
RUN powershell -Command Install-WindowsFeature Web-Http-Tracing

COPY dotnet-hosting-2.2*-win.exe dotnet-hosting-2.2-win.exe

RUN powershell -Command Start-Process .\dotnet-hosting-2.2-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.2-win.exe

ENV appcmd=C:/Windows/System32/inetsrv/appcmd.exe

# Enable Failed Request Tracing in C:\Windows\System32\inetsrv\Config\applicationHost.config
RUN %appcmd% set site "Default Web Site" -traceFailedRequestsLogging.enabled:"true" /commit:apphost

# Configure Failed Request Tracing in C:\inetpub\wwwroot\web.config
RUN %appcmd% set config "Default Web Site" -section:system.webServer/tracing/traceFailedRequests /+"[path='*']" & \
    %appcmd% set config "Default Web Site" -section:system.webServer/tracing/traceFailedRequests /+"[path='*'].traceAreas.[provider='WWW Server',areas='ANCM',verbosity='Verbose']" & \
    %appcmd% set config "Default Web Site" -section:system.webServer/tracing/traceFailedRequests /[path='*'].failureDefinitions.statusCodes:"200-999"

# Override ENTRYPOINT to allow IIS reset without stopping container.  Base image uses
# 'ENTRYPOINT ["C:\\ServiceMonitor.exe", "w3svc"]', which causes container to stop
# when IIS is stopped or reset.  
ENTRYPOINT [ "timeout", "-1" ]
