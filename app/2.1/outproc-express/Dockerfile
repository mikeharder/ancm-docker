FROM microsoft/dotnet:2.1.302-sdk-nanoserver-1803 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build app
COPY . ./
RUN dotnet publish -c Release -o out


FROM microsoft/ancm-express:2.1-windowsservercore-1803
RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
WORKDIR /inetpub/wwwroot
COPY --from=build /app/out ./
