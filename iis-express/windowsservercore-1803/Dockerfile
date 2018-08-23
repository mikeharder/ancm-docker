FROM microsoft/windowsservercore:1803

RUN powershell -command (New-Object System.Net.WebClient).DownloadFile('https://download.microsoft.com/download/C/E/8/CE8D18F5-D4C0-45B5-B531-ADECD637A1AA/iisexpress_amd64_en-US.msi', 'iisexpress_amd64_en-US.msi') ; \
    Start-Process .\iisexpress_amd64_en-US.msi -ArgumentList '/quiet /norestart' -Wait ; \
    rm iisexpress_amd64_en-US.msi

# .NET Framework app pools fail because "user manager\containeradministrator" does not have write access
# to "%windir%\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files", and I cannot figure out
# how to grant access.  So we use an app pool without .NET Framework.
RUN ""C:\Program Files\IIS Express\appcmd.exe" /apphostconfig:"C:\Program Files\IIS Express\config\templates\PersonalWebServer\applicationhost.config" set app "WebSite1/" /applicationPool:UnmanagedClassicAppPool"
RUN ""C:\Program Files\IIS Express\appcmd.exe" /apphostconfig:"C:\Program Files\IIS Express\config\templates\PersonalWebServer\applicationhost.config" set config -section:system.applicationHost/sites /applicationDefaults.applicationPool:"UnmanagedClassicAppPool" /commit:apphost"

COPY entrypoint/entrypoint.cmd /

ENTRYPOINT entrypoint.cmd
