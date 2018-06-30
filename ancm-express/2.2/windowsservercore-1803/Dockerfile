FROM microsoft/iis-express:windowsservercore-1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY dotnet-hosting-*-win.exe dotnet-hosting-2.2-win.exe

RUN Start-Process .\dotnet-hosting-2.2-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.2-win.exe

COPY ancm_iis_express_*.msi ./

RUN Start-Process .\ancm_iis_express_x64_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x64_en_v2.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x86_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x86_en_v2.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm ancm_iis_express_*.msi

# Add ANCM sections to applicationhost.config (search file for "MODIFICATION")
COPY applicationhost.config /
