FROM microsoft/iis-express:windowsservercore-1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/9/3/E/93ED35C8-57B9-4D50-AE32-0330111B38E8/dotnet-hosting-2.1.1-win.exe', 'dotnet-hosting-2.1.1-win.exe') ; \
    Start-Process .\dotnet-hosting-2.1.1-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.1.1-win.exe

COPY ancm_iis_express_*.msi ./

RUN Start-Process .\ancm_iis_express_x64_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x86_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm ancm_iis_express_*.msi

# Add ANCM sections to applicationhost.config (search file for "MODIFICATION")
COPY applicationhost.config /
