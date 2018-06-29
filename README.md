# ancm-docker

Scripts and dockerfiles to run ANCM and IIS in Windows Containers.

## netcoreapp2.1 + IIS + ANCM v1 (Out-Of-Process)
1. `cd ancm\2.1\windowsservercore-1803`
2. `build.cmd`
3. `cd ..\..\..`
4. `cd app\2.1\outproc`
5. `build.cmd`
6. `run.cmd`
7. `test.cmd`

## netcoreapp2.2 + IIS + ANCM v2 (Out-Of-Process or In-Process)
1. `cd ancm\2.2\windowsservercore-1803`
2. Copy desired build of hosting bundle (`dotnet-hosting-2.2.0*.exe`) to this directory
3. `build.cmd`
4. (Optional) Delete hosting bundle from local directory
5. `cd ..\..\..`
5. `cd app\2.2`
6. Edit `app.csproj` and set `RuntimeFrameworkVersion` and `MicrosoftAspNetCoreAppPackageVersion` to versions installed by hosting bundle
7. `cd [inproc|outproc]`
7. `build.cmd`
8. `run.cmd`
9. `test.cmd`

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
