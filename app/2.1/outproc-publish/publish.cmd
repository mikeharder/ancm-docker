@call %~dp0\util\util.cmd

: Publish to local folder volume mapped into container
rmdir /s /q %ancm%\apps\%publish_path%
dotnet publish -c Release -o %ancm%\apps\%publish_path% %~dp0..\app.csproj

: Create folder for stdout logs and give IIS full permissions
mkdir %ancm%\apps\%publish_path%\logs
docker exec -it %container% cmd /c icacls C:\apps\%publish_path%\logs /grant "IIS APPPOOL\DefaultAppPool":F

: Register app with IIS
docker exec -it %container% cmd /c %appcmd% delete app "Default Web Site/%http_path%"
docker exec -it %container% cmd /c %appcmd% add app /site.name:"Default Web Site" /path:/%http_path% /physicalPath:C:\apps\%publish_path%
