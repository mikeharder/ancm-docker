@call %~dp0\util\util.cmd

docker run -d -t --rm -v %~dp0share:C:\share --name %container% %image%
