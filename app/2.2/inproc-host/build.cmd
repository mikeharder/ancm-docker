dotnet publish -c Release -o %~dp0/out /p:AspNetCoreHostingModel=inprocess %~dp0/../app.csproj
