FROM microsoft/iis-express:windowsservercore-1803

# Install .NET Core and ASP.NET Core Runtimes
RUN powershell -Command \
    (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/6/E/B/6EBD972D-2E2F-41EB-9668-F73F5FDDC09C/dotnet-runtime-2.1.3-win-x64.exe', 'dotnet-runtime-2.1.3-win-x64.exe') ; \
    Start-Process .\dotnet-runtime-2.1.3-win-x64.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-runtime-2.1.3-win-x64.exe ; \
    (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/6/E/B/6EBD972D-2E2F-41EB-9668-F73F5FDDC09C/aspnetcore-runtime-2.1.3-win-x64.exe', 'aspnetcore-runtime-2.1.3-win-x64.exe') ; \
    Start-Process .\aspnetcore-runtime-2.1.3-win-x64.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm aspnetcore-runtime-2.1.3-win-x64.exe

# Install ANCM for IIS Express
COPY ancm_iis_express_*.msi ./
RUN powershell -command Start-Process .\ancm_iis_express_x64_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x86_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm ancm_iis_express_*.msi

