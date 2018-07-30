@call %~dp0\util\util.cmd

docker run -it --rm --entrypoint cmd %image%
