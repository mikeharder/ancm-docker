@call %~dp0\util\util.cmd

for /l %%i in (1,1,%num_apps%) do (
    type %ancm%\apps\%publish_path%\%%i\logs\stdout*.log
)
