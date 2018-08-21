@if not defined ancm_version (
    @set ancm_version=2.1.3
)

@set ancm=%~dp0..\..\..\..\ancm\%ancm_version%\windowsservercore-1803
@call %ancm%\util\util.cmd

@set version=2.1
@set app=outproc
@set publish_path=%version%\%app%
@set http_path=%version%/%app%
