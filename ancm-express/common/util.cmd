@set common=%~dp0\..\..\common
@set appcmd="C:\Program Files\IIS Express\appcmd.exe"
@set eventproviders='IIS Express','IIS Express AspNetCore Module*'
@set iisreset=taskkill /f /im iisexpress.exe
@set modulepath="C:\Program Files\IIS Express\aspnetcore.dll"
@set port=8080
