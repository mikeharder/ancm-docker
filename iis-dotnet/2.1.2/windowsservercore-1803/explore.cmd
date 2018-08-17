@call %~dp0\util\util.cmd

docker run -it --rm -v %~dp0share:C:\share --entrypoint cmd %image%
