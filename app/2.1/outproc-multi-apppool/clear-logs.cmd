@call %~dp0\util\util.cmd

@call %ancm%\clear-eventlog.cmd

del /s %ancm%\share\%publish_path%\stdout*.log
