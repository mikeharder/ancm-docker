@call %~dp0\util\util.cmd

docker run -d -t --rm -v %~dp0apps:C:\apps --name %container% %image%
