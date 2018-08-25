@set ancm=%~dp0..\..\..\..\ancm-express\2.2-preview\windowsservercore-1803
@call %ancm%\util\util.cmd

@set version=2.2
@set app=inproc
@set publish_path=%version%\%app%
@set http_path=%version%/%app%
@set hosting_model=inprocess