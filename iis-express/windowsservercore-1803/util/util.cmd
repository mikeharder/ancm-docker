@set common=%~dp0\..\..\..\common

@set image=microsoft/iis-express:windowsservercore-1803
@set container=microsoft-iis-express-windowsservercore-1803

@set apphostconfigtemplate="C:\Program Files\IIS Express\config\templates\PersonalWebServer\applicationhost.config"
@set appcmd="C:\Program Files\IIS Express\appcmd.exe"
@set eventproviders='IIS Express'
@set iisreset=taskkill /f /im iisexpress.exe
@set port=8080
