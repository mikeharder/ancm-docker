@call %~dp0\util\util.cmd

: Kill dotnet.exe to unlock stdout logfiles for deletion
@call %~dp0\kill-dotnet.cmd

for /l %%i in (1,1,%num_apps%) do (
    : Unregister app with IIS
    docker exec -it %container% cmd /c %appcmd% delete app "Default Web Site/%http_path%/%%i"

    : Publish to local folder volume mapped into container
    rmdir /s /q %ancm%\share\%publish_path%\%%i
    dotnet publish -c Release -o %ancm%\share\%publish_path%\%%i %~dp0..\app.csproj

    : Create folder for stdout logs and give IIS full permissions
    mkdir %ancm%\share\%publish_path%\%%i\logs
    docker exec -it %container% cmd /c icacls C:\share\%publish_path%\%%i\logs /grant "IIS APPPOOL\DefaultAppPool":F

    : Register app with IIS
    docker exec -it %container% cmd /c %appcmd% add app /site.name:"Default Web Site" /path:/%http_path%/%%i /physicalPath:C:\share\%publish_path%\%%i
)
