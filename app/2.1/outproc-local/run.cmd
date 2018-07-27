: appcmd does not support ".." in path (causes config load error)
set relative_path=%~dp0\..\bin\release\netcoreapp2.1\publish
for %%i in ("%relative_path%") do SET "normalized_path=%%~fi"

C:\windows\system32\inetsrv\appcmd.exe add app /site.name:"Default Web Site" /path:/ancm-app-2.1-outproc /physicalPath:%normalized_path%
