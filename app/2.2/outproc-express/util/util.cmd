@if not defined ancm_version (
    @set ancm_version=2.2-preview
)

@set ancm=%~dp0..\..\..\..\ancm-express\%ancm_version%\windowsservercore-1803
@call %ancm%\util\util.cmd

@set version=2.2
@set app=outproc
@set publish_path=%version%\%app%
@set http_path=%version%/%app%
