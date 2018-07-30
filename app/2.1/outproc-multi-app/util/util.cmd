@set ancm=%~dp0..\..\..\..\ancm\2.1\windowsservercore-1803
@call %ancm%\util\util.cmd

@set version=2.1
@set app=outproc-multi-app
@set publish_path=%version%\%app%
@set http_path=%version%/%app%

@set num_apps=10