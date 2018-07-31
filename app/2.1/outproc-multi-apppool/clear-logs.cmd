@call %~dp0\util\util.cmd

@call %ancm%\clear-eventlog.cmd

del /s %ancm%\apps\%publish_path%\stdout*.log
