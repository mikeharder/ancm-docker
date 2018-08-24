@set common=..\..\..\common

@set image=microsoft/ancm:2.1-preview-windowsservercore-1803
@set container=microsoft-ancm-2.1-preview-windowsservercore-1803

@set appcmd=C:\windows\system32\inetsrv\appcmd.exe
@set eventproviders='Microsoft-Windows-IIS*','IIS AspNetCore Module*'
@set iisreset=iisreset
@set modulepath=\windows\system32\inetsrv\aspnetcore.dll
