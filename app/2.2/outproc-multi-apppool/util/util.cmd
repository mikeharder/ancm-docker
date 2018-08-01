@set ancm=%~dp0..\..\..\..\ancm\2.2\windowsservercore-1803
@call %ancm%\util\util.cmd

@set version=2.2
@set app=outproc-multi-apppool
@set publish_path=%version%\%app%
@set http_path=%version%/%app%
@set hosting_model=outofprocess

@set num_apps=10