FROM microsoft/dotnet:2.1.300-sdk-nanoserver-1803 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./

# Disable parallel restore to prevent timeouts (https://github.com/NuGet/Home/issues/6742)
RUN dotnet restore --disable-parallel

# copy everything else and build app
COPY . ./
ARG hosting_model
RUN dotnet publish -c Release -o out /p:AspNetCoreModuleHostingModel=%hosting_model%

FROM microsoft/ancm-express:2.2-windowsservercore-1803
RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
WORKDIR /inetpub/wwwroot
COPY --from=build /app/out ./
