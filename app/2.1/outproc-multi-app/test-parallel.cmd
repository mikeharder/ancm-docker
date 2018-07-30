@call %~dp0\util\util.cmd

for /l %%i in (1,1,%num_apps%) do (
  start /b docker exec -it %container% cmd /c curl -v http://localhost:80/%http_path%/%%i
)