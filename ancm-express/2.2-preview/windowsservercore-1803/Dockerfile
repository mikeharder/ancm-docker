FROM microsoft/iis-express:windowsservercore-1803

# Install .NET Core and ASP.NET Core Runtimes.  Easier to install via hosting bundle, rather than
# finding the matching versions of the .NET Core and ASP.NET Core runtimes, but either should work.
COPY dotnet-hosting-2.2*-win.exe dotnet-hosting-2.2-win.exe
RUN powershell -Command Start-Process .\dotnet-hosting-2.2-win.exe -ArgumentList '/quiet /norestart' -Wait ; \
    rm dotnet-hosting-2.2-win.exe

# Install ANCM for IIS Express
COPY ancm_iis_express_*.msi ./
RUN powershell -command \
    Start-Process .\ancm_iis_express_x64_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x86_en.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x64_en_v2.msi -ArgumentList '/quiet /norestart' -Wait ; \
    Start-Process .\ancm_iis_express_x86_en_v2.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm ancm_iis_express_*.msi
