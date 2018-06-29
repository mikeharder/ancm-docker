FROM microsoft/windowsservercore:1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/C/E/8/CE8D18F5-D4C0-45B5-B531-ADECD637A1AA/iisexpress_amd64_en-US.msi', 'iisexpress_amd64_en-US.msi') ; \
    Start-Process .\iisexpress_amd64_en-US.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm iisexpress_amd64_en-US.msi

# IIS Express only supports localhost requests by default.  Attempts to modify applicationhost.config to support
# external requests were unsuccessful, but proxying seems to work.
RUN netsh interface portproxy add v4tov6 listenport=80 connectaddress=[::1] connectport=8080

EXPOSE 80

WORKDIR /app

# Add custom applicationhost.config to disable .NET Framework which fails inside container (search file for "MODIFICATION")
COPY index.html applicationhost.config /app/

ENTRYPOINT [ "C:\\Program Files\\IIS Express\\iisexpress.exe", "/config:C:\\app\\applicationhost.config", "/systray:false" ]
