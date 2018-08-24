@call %~dp0\util\util.cmd

: Kill dotnet.exe to unlock stdout logfiles for deletion
@call %~dp0\kill-dotnet.cmd

: Unregister app with IIS
docker exec -it %container% cmd /c %appcmd% delete app "WebSite1/%http_path%"

: Publish to local folder volume mapped into container
rmdir /s /q %ancm%\share\%publish_path%
dotnet publish -c Release -o %ancm%\share\%publish_path% %~dp0..\app.csproj

: Create folder for stdout logs and give IIS full permissions
mkdir %ancm%\share\%publish_path%\logs
: docker exec -it %container% cmd /c icacls C:\share\%publish_path%\logs /grant "IIS APPPOOL\DefaultAppPool":F

: Register app with IIS
docker exec -it %container% cmd /c %appcmd% add app /site.name:"WebSite1" /path:/%http_path% /physicalPath:C:\share\%publish_path%
