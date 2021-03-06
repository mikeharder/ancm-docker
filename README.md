# ancm-docker

Scripts and dockerfiles to run ANCM and IIS in Windows Containers.

## netcoreapp2.1 + IIS + ANCM v1 RTM (Out-Of-Process)
1. `cd ancm\2.1.3\windowsservercore-1803`
2. `build.cmd`
3. `cd ..\..\..`
4. `cd app\2.1\outproc`
5. `run.cmd` (starts container)
6. `publish.cmd` (publish app to container, register app with IIS)
7. `test.cmd` (execute `curl http://localhost:port/path` inside container)
8. `stop.cmd` (stops container)

## netcoreapp2.1 + IIS + ANCM v1 Preview (Out-Of-Process)
1. `cd ancm\2.1-preview\windowsservercore-1803`
2. Copy desired build of ANCM MSIs (`aspnetcoremodule_x64_en.msi` and `aspnetcoremodule_x86_en.msi`) to this directory
2. `build.cmd`
3. `cd ..\..\..`
4. `cd app\2.1\outproc`
5. `use-2.1-preview.cmd` (selects `2.1-preview` image, default is `2.1.3`)
5. `run.cmd` (starts container)
6. `publish.cmd` (publish app to container, register app with IIS)
7. `test.cmd` (execute `curl http://localhost:port/path` inside container)
8. `stop.cmd` (stops container)

## netcoreapp2.2 + IIS + ANCM v2 Preview (Out-Of-Process or In-Process)
1. `cd ancm\2.2-preview\windowsservercore-1803`
2. Copy desired build of hosting bundle (`dotnet-hosting-2.2.0*.exe`) to this directory
3. `build.cmd`
4. `cd ..\..\..`
5. `cd app\2.2`
6. Edit `app.csproj` and set `RuntimeFrameworkVersion` and `MicrosoftAspNetCoreAppPackageVersion` to versions installed by hosting bundle
7. `cd [inproc|outproc]`
5. `run.cmd` (starts container)
6. `publish.cmd` (publish app to container, register app with IIS)
7. `test.cmd` (execute `curl http://localhost:port/path` inside container)
8. `stop.cmd` (stops container)

## netcoreapp2.1 + IIS Express + ANCM v1 Preview (Out-Of-Process)
1. `cd iis-express\windowsservercore-1803`
1. `build.cmd`
1. `cd ..\..`
1. `cd ancm-express\2.1-preview\windowsservercore-1803`
1. Copy IIS Express MSIs (listed below) to this directory
   1. `ancm_iis_express_x64_en.msi`
   1. `ancm_iis_express_x86_en.msi`
1. `build.cmd`
1. `cd ..\..\..`
1. `cd app\2.1\outproc-express`
5. `run.cmd` (starts container)
6. `publish.cmd` (publish app to container, register app with IIS)
7. `test.cmd` (execute `curl http://localhost:port/path` inside container)
8. `stop.cmd` (stops container)

## netcoreapp2.2 + IIS Express + ANCM v2 (Out-Of-Process or In-Process)
1. `cd iis-express\windowsservercore-1803`
1. `build.cmd`
1. `cd ..\..`
1. `cd ancm-express\2.2\windowsservercore-1803`
1. Copy desired build of hosting bundle and IIS Express MSIs (listed below) to this directory
   1. `dotnet-hosting-2.2.0*.exe`
   1. `ancm_iis_express_x64_en.msi`
   1. `ancm_iis_express_x64_en_v2.msi`
   1. `ancm_iis_express_x86_en.msi`
   1. `ancm_iis_express_x86_en_v2.msi`
1. `build.cmd`
1. `cd ..\..\..`
1. `cd app\2.2`
1. Edit `app.csproj` and set `RuntimeFrameworkVersion` and `MicrosoftAspNetCoreAppPackageVersion` to versions installed by hosting bundle
1. `cd [inproc-express|outproc-express]`
5. `run.cmd` (starts container)
6. `publish.cmd` (publish app to container, register app with IIS)
7. `test.cmd` (execute `curl http://localhost:port/path` inside container)
8. `stop.cmd` (stops container)

## Additional Utility scripts
### 32-bit.cmd
Changes app pool to 32-bit.

### 64-bit.cmd
Changes app pool to 64-bit.

### attach.cmd
Attaches command prompt to running container.  Useful for inspecting the state of the container while running, debugging, etc.

### disable.cmd
Sets reg key to disable ANCM and restarts IIS (to re-read reg key).

### enable.cmd
Removes reg key to disable ANCM and restarts IIS (to re-read reg key).

### eventlog.cmd
Write events from provider `IIS AspNetCore Module` to console.

### explore.cmd
Runs image with command prompt instead of starting IIS.  Useful for inspecting the state of the container before IIS starts.

### offline.cmd
Creates `app_offline.htm`.

### online.cmd
Deletes `app_offline.htm`.

### tasklist.cmd
Writes task list to console.
