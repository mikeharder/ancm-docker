@call %~dp0\util\util.cmd

rmdir /s /q %ancm%\apps\%publish_path%
dotnet publish -c Release -o %ancm%\apps\%publish_path% %~dp0..\app.csproj

docker exec -it %container% cmd /c %appcmd% delete app "Default Web Site/%http_path%"
docker exec -it %container% cmd /c %appcmd% add app /site.name:"Default Web Site" /path:/%http_path% /physicalPath:C:\apps\%publish_path%
