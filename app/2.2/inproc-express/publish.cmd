@call %~dp0\util\util.cmd

: Unregister app with IIS
docker exec -it %container% cmd /c %appcmd% delete app "WebSite1/%http_path%"

: Reset IIS to unlock stdout logfiles for deletion
@call %~dp0\iisreset.cmd

: Publish to local folder volume mapped into container
rmdir /s /q %ancm%\share\%publish_path%
dotnet publish -c Release -o %ancm%\share\%publish_path% /p:AspNetCoreModuleHostingModel=%hosting_model% %~dp0..\app.csproj

: Create folder for stdout logs and give IIS full permissions
mkdir %ancm%\share\%publish_path%\logs

: Register app with IIS
docker exec -it %container% cmd /c %appcmd% add app /site.name:"WebSite1" /path:/%http_path% /physicalPath:C:\share\%publish_path%
