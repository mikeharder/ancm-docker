dotnet publish -c Release -o %~dp0/out /p:AspNetCoreModuleHostingModel=inprocess %~dp0/../app.csproj
