@call %~dp0\util\util.cmd

: Kill dotnet.exe to unlock stdout logfiles for deletion
@call %~dp0\kill-dotnet.cmd

for /l %%i in (1,1,%num_apps%) do (
    : Delete app pool
    docker exec -it %container% cmd /c %appcmd% delete apppool /name:%app%-%%i

    : Unregister app with IIS
    docker exec -it %container% cmd /c %appcmd% delete app "Default Web Site/%http_path%/%%i"

    : Publish to local folder volume mapped into container
    rmdir /s /q %ancm%\share\%publish_path%\%%i
    dotnet publish -c Release -o %ancm%\share\%publish_path%\%%i  /p:AspNetCoreModuleHostingModel=%hosting_model% %~dp0..\app.csproj

    : Create app pool
    docker exec -it %container% cmd /c %appcmd% add apppool /name:%app%-%%i

    : Create folder for stdout logs and give IIS full permissions
    mkdir %ancm%\share\%publish_path%\%%i\logs
    docker exec -it %container% cmd /c icacls C:\share\%publish_path%\%%i\logs /grant "IIS APPPOOL\%app%-%%i":F

    : Register app with IIS
    docker exec -it %container% cmd /c %appcmd% add app /site.name:"Default Web Site" /path:/%http_path%/%%i /physicalPath:C:\share\%publish_path%\%%i

    : Assign app to pool
    docker exec -it %container% cmd /c %appcmd% set app "Default Web Site/%http_path%/%%i" /applicationPool:%app%-%%i
)
