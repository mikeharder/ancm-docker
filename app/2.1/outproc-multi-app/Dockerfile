FROM microsoft/dotnet:2.1.302-sdk-nanoserver-1803 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out


FROM microsoft/ancm:2.1-windowsservercore-1803

WORKDIR /app
COPY --from=build /app/out ./

SHELL ["cmd", "/S", "/C"]

RUN C:\windows\system32\inetsrv\appcmd.exe add app /site.name:"Default Web Site" /path:/app1 /physicalPath:C:\app
